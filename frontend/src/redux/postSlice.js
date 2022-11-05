import { createSlice } from "@reduxjs/toolkit";

const postSlice = createSlice({
    name: "post",
    initialState: {
        post: {
            currentPost: null,
            isFetching: false,
            error: false
        },
    },
    reducers: {
        postStart: (state) => {
            state.post.isFetching = true;
        },
        postSuccess: (state, action) => {
            state.post.isFetching = false;
            state.post.currentPost = action.payload;
            state.post.error = false;
        }
    }
});

export const {
    postStart,
    postFailed,
    postSuccess
} = postSlice.actions;

export default postSlice.reducer;