using { bookshop as db } from '../db/schema';

service BooksService @(requires: 'authenticated-user') {
    @odata.draft.enabled
    entity Books @(restrict: [
        { grant: 'READ' },
        { grant: 'CREATE', to: 'admin' },
        { grant: ['UPDATE', 'DELETE'], to: 'admin', where: 'createdBy = $user' }
    ]) as projection on db.Books {
        *,
        createdBy as owner,
        null as updateHidden    : Boolean,
        null as deleteHidden    : Boolean,
        null as canDelete       : Boolean
    };

    @cds.persistence.skip
    @odata.singleton
    entity ButtonVisibility {
        createHidden    : Boolean;
        updateHidden    : Boolean;
        deleteHidden    : Boolean;
        deletable       : Boolean;
    }
}