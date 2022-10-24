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

export const logoutUser = async(dispatch, id, navigate, accessToken) => {
    dispatch(logoutStart());
    try {
        dispatch(logoutSuccess());
        navigate("/");
    } catch (err) {
        dispatch(logoutFailed());
    }
}