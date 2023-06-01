const cds = require('@sap/cds');

class BooksService extends cds.ApplicationService {
    init() {
        this.on('READ', 'Books', async (req, next) => {
            const columns = req.query.SELECT.columns;
            if (columns && !columns.find(column => column.ref[0] === 'createdBy')) {
                columns.push({ref: ['createdBy']})
            }
            await next();
            if (Array.isArray(req.results)) {
                req.results.forEach(book => this.#setAccessFields(book, req.user));
            } else {
                this.#setAccessFields(req.results, req.user);
            }
        });

        this.on('READ', 'ButtonVisibility', (req) => {
            return {
                createHidden: !req.user.is('admin'),
                updateHidden: !req.user.is('admin'),
                deleteHidden: !req.user.is('admin'),
                deletable: req.user.is('admin')
            }
        });

        return super.init();
    }

    #setAccessFields(book, user) {
        const userHasElevatedRights = user.is('admin') && book.createdBy === user.id;
        book.canUpdate = userHasElevatedRights;
        book.canDelete = userHasElevatedRights;
        book.deleteHidden = !userHasElevatedRights;
        book.updateHidden = !userHasElevatedRights;
    }
}

module.exports = BooksService;
