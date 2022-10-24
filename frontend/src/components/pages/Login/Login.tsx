import { useState, FormEvent } from "react";
import { loginUser } from "../../../redux/apiRequest";
import "./Login.css";
import { useDispatch } from 'react-redux';
import { useNavigate } from 'react-router-dom';
import { useSelector } from 'react-redux';


const Login: React.FC = props => {
    const [username, setUsername] = useState('');
    const [password, setPassword] = useState('');
    const [login, isLogin] = useState(1);
    const dispatch = useDispatch();
    const navigate = useNavigate();
    const signInSubmit = (e: FormEvent) => {
        e.preventDefault();
        const newUser = {
            username: username,
            password: password,
        };
        loginUser(newUser, dispatch, navigate);
    };

    const renderSwitch = () => {
        switch (login) {
            case 1:
                return (
                    <form className="login-form" onSubmit={signInSubmit}>
                        <h2 className="login-title">Login</h2>
                        <input type="text" className="login-input" placeholder="Username" onChange={(e) => setUsername(e.target.value)} />
                        <input type="password" className="login-input" placeholder="Password" onChange={(e) => setPassword(e.target.value)} />
                        <span className="forgot" onClick={() => isLogin(3)}>Forgot Password</span>
                        <button className="btn-login">Login Now</button>
                        <button className="btn-register" onClick={() => isLogin(2)}>Register A New Account</button>
                    </form>
                )
            case 2:
                return (
                    <form className="login-form">
                        <h2 className="login-title">Registration</h2>
                        <input type="text" className="login-input" placeholder="Username" />
                        <input type="password" className="login-input" placeholder="Password" />
                        <input type="password" className="login-input" placeholder="Re-enter password" />
                        <input type="text" className="login-input" placeholder="Email" />
                        <input type="text" className="login-input" placeholder="Mobile Number" />
                        <button className="btn-login">Register</button>
                    </form>
                )
            case 3:
                return (
                    <form className="login-form">
                        <h2 className="login-title">Reset Password</h2>
                        <p className="reset-title">Please enter the username you use to sign in</p>
                        <input type="text" className="login-input" placeholder="Username" />
                        <button className="btn-login">Reset Password</button>
                    </form>
                )
        }
    }

    return (
        <div id="Login">
            <h1 className="vinhome-title">Vinhomes Grand Park Marketplace</h1>
            {renderSwitch()}
        </div>
    );
}

export default Login;