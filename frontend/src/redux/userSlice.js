import { createSlice } from "@reduxjs/toolkit";

const userSlice = createSlice({
    name: "user",
    initialState: {
        user: {
            currentUser: null,
            isFetching: false,
            error: false
        },
    },
    reducers: {
        userStart: (state) => {
            state.user.isFetching = true;
        },
        userSuccess: (state, action) => {
            state.user.isFetching = true;
            state.user.currentUser = action.payload;
            state.user.error = false;
        },
        userFailed: (state) => {
            state.user.isFetching = true;
            state.user.error = true;
        },
        clearUserStart: (state) => {
            state.user.isFetching = true;
        },
        clearUserSuccess: (state) => {
            state.user.isFetching = true;
            state.user.currentUser = null;
            state.user.error = false;
        },
        clearUserFailed: (state) => {
            state.user.isFetching = false;
            state.user.error = true;
        }
    }
});

export const {
    userStart,
    userFailed,
    userSuccess,
    clearUserStart,
    clearUserSuccess,
    clearUserFailed
} = userSlice.actions;

export default userSlice.reducer;