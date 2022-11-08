import axios from "axios";
import { loginFailed, loginStart, loginSuccess, logoutFailed, logoutStart, logoutSuccess } from "./authSlice";
import { cartFailed, cartStart, cartSuccess, clearFailed, clearStart, clearSuccess, quantityFailed, quantityStart, quantitySuccess } from "./cartSlice";
import { postFailed, postStart, postSuccess } from "./postSlice";
import { clearUserSuccess, userFailed, userStart, userSuccess } from "./userSlice";


// export const loginUser = async (user, dispatch, navigate) => {
//     dispatch(loginStart());
//     try {
//         const res = await axios.post("https://localhost:5001/api/authen/login", user);
//         dispatch(loginSuccess(res.data));
//         console.log(res.data);
//         navigate("/");
//     } catch (err) {
//         dispatch(loginFailed());
//     }
// };

export const loginUser = async (user, dispatch, navigate) => {
    dispatch(loginStart());
    try {
        const res = await axios.post("http://nguyenxuanthuan-001-site1.htempurl.com/api/authen/login", user);
        dispatch(loginSuccess(res.data));
        navigate("/");
    } catch (err) {
        dispatch(loginFailed());
    }
};


export const registerUser = async (user) => {
    try {
        const res = await axios.post("http://nguyenxuanthuan-001-site1.htempurl.com/api/accounts", user);
        console.log(res.data);
    } catch (err) {
        return err
    }
};

export const logoutUser = async (dispatch, navigate) => {
    dispatch(logoutStart());
    try {
        dispatch(clearSuccess());
        dispatch(clearUserSuccess());
        dispatch(logoutSuccess());
        navigate("/");
    } catch (err) {
        dispatch(logoutFailed());
    }
}

export const getUser = async (id, jwtToken, dispatch) => {
    dispatch(userStart());
    try {
        const res = await fetch(`http://nguyenxuanthuan-001-site1.htempurl.com/api/accounts/${id}`, {
            headers: {
                Authorization: `Bearer ${jwtToken}`,
                'Content-Type': 'application/json'
            }
        });
        const data = await res.json();
        dispatch(userSuccess(data.data));
    } catch (err) {
        dispatch(userFailed());
    }
}

export const getCategoryById = async (id) => {
    try {
        const res = await fetch(`http://nguyenxuanthuan-001-site1.htempurl.com/api/categories/${id}`);
        const data = await res.json();
        return data;
    } catch (error) {
        return error;
    }
}

export const getBuidings = async () => {
    try {
        const res = await fetch("http://nguyenxuanthuan-001-site1.htempurl.com/api/buildings");
        const data = await res.json();
        return data;
    } catch (error) {
        return error;
    }
}

export const checkoutRequest = async (checkoutData, user) => {
    try {
        const res = await axios.post("http://nguyenxuanthuan-001-site1.htempurl.com/api/checkouts", checkoutData, {
            headers: {
                Authorization: `Bearer ${user?.jwtToken}`,
                'Content-Type': 'application/json'
            },
        });
    } catch (error) {
        return error;
    }
}

export const getPost = async (post, dispatch, navigate) => {
    dispatch(postStart());
    try {
        dispatch(postSuccess(post));
        navigate("/product");
    } catch (err) {
        dispatch(postFailed());
    }
};

export const addToCart = async (post, dispatch) => {
    dispatch(cartStart());
    try {
        dispatch(cartSuccess({
            post: post,
            quantity: 1
        }));
    } catch (err) {
        dispatch(cartFailed());
    }
};

export const addQuantity = async (cart, dispatch) => {
    dispatch(quantityStart());
    try {
        dispatch(quantitySuccess(cart));
    } catch (err) {
        dispatch(quantityFailed());
    }
};

export const clearCart = async (dispatch) => {
    dispatch(clearStart());
    try {
        dispatch(clearSuccess());
    } catch (err) {
        dispatch(clearFailed());
    }
};
