export const productConstants = {
    GET_PRODUCTS_LOADING:       'GET_PRODUCTS_USER_LOADING',
    GET_PRODUCTS_SUCCESS:       'GET_PRODUCTS_USER_SUCCESS',
    GET_PRODUCTS_FAILURE:       'GET_PRODUCTS_USER_FAILURE',

    ADD_LOVED_PRODUCT:          'ADD_LOVED_PRODUCT',
    DELETE_LOVED_PRODUCT:       'DELETE_LOVED_PRODUCT',

    ADD_BUY_LATE_PRODUCT:       'ADD_BUY_LATE_PRODUCT',
    DELETE_BUY_LATE_PRODUCT:    'DELETE_BUY_LATE_PRODUCT',

    ADD_VIEWED_PRODUCT:         'ADD_VIEWED_PRODUCT',
    DELETE_VIEWED_PRODUCT:      'DELETE_VIEWED_PRODUCT',
};

export const ProductType = Object.freeze({
    'LovedProduct':     1,
    "ViewedProduct":    2,
    "BuyLateProduct":   3
})