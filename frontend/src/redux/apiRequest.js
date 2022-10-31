import axios from "axios";
import { loginFailed, loginStart, loginSuccess, logoutFailed, logoutStart, logoutSuccess } from "./authSlice";

export const loginUser = async(user, dispatch, navigate) => {
    dispatch(loginStart());
    try {
        const res = await axios.post("https://localhost:5001/api/authen/login", user);
        dispatch(loginSuccess(res.data));
        console.log(res.data);
        navigate("/");
    } catch (err) {
        dispatch(loginFailed());
    }
};

export const logoutUser = async(dispatch, navigate) => {
    dispatch(logoutStart());
    try {
        dispatch(logoutSuccess());
        navigate("/");
    } catch (err) {
        dispatch(logoutFailed());
    }
}

export const getCategoryById = async(id) => {
    try {
        const res = await fetch(`https://localhost:5001/api/categories/${id}`);
        const data = await res.json();
        return data;
    } catch (error) {
        return error;
    }
}
