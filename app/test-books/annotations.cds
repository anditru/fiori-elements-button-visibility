using BooksService from '../../srv/books-service';


annotate BooksService.Books with @(
    // Create Button
    UI.CreateHidden: { $edmJson: { $Path: '/ButtonVisibility/createHidden' } }, // This syntax is necessary if you want to bind to a field that is not part of the entity being annotated

    // Edit Button
    // UI.UpdateHidden: { $edmJson: { $Path: '/ButtonVisibility/updateHidden' } },
    UI.UpdateHidden: updateHidden,

    // Delete Button
    // UI.DeleteHidden: { $edmJson: { $Path: '/ButtonVisibility/deleteHidden' } },
    UI.DeleteHidden: deleteHidden,
    // Capabilities.Deletable: { $edmJson: { $Path: '/ButtonVisibility/deletable' } },
);

// List Report
annotate BooksService.Books with @(UI : {
    SelectionFields : [
        ID,
        price,
        currency
    ],
    LineItem : [
        {Value : author},
        {Value : title},
        {Value : owner},
        {Value : genre},
        {Value : price},
        {Value : currency},
    ]
}, );

// Object Page
annotate BooksService.Books with @(UI : {
    HeaderInfo : {
        TypeName       : 'Book',
        TypeNamePlural : 'Books',
        Title          : {Value : title},
        Description    : {Value : author}
    },
    HeaderFacets : [{
        $Type  : 'UI.ReferenceFacet',
        Label  : '{i18n>Description}',
        Target : '@UI.FieldGroup#Descr'
    }, ],
    Facets : [{
        $Type  : 'UI.ReferenceFacet',
        Label  : '{i18n>Details}',
        Target : '@UI.FieldGroup#Price'
    }, ],
    FieldGroup #Descr : {Data : [{
        Value : descr,
        Label: ''
    }, ]},
    FieldGroup #Price : {Data : [
        {Value : price},
        {Value : currency},
    ]},
});
