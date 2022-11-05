import { createSlice } from "@reduxjs/toolkit";

const cartSlice = createSlice({
    name: "cart",
    initialState: {
        cart: {
            currentCart: [],
            isFetching: false,
            error: false
        },
    },
    reducers: {
        cartStart: (state) => {
            state.cart.isFetching = true;
        },
        cartSuccess: (state, action) => {
            state.cart.isFetching = false;
            state.cart.currentCart.push(action.payload);
            state.cart.error = false;
        },
        cartFailed: (state) => {
            state.login.isFetching = false;
            state.login.error = true;
        },
        quantityStart: (state) => {
            state.cart.isFetching = true;
        },
        quantitySuccess: (state, action) => {
            state.cart.isFetching = false;
            state.cart.currentCart = (action.payload);
            state.cart.error = false;
        },
        quantityFailed: (state) => {
            state.login.isFetching = false;
            state.login.error = true;
        },
        clearStart: (state) => {
            state.cart.isFetching = true;
        },
        clearSuccess: (state) => {
            state.cart.isFetching = false;
            state.cart.currentCart = [];
            state.cart.error = false;
        },
        clearFailed: (state) => {
            state.login.isFetching = false;
            state.login.error = true;
        }
    }
});

export const {
    cartStart,
    cartFailed,
    cartSuccess,
    quantityStart,
    quantityFailed,
    quantitySuccess,
    clearStart,
    clearFailed,
    clearSuccess
} = cartSlice.actions;

export default cartSlice.reducer;