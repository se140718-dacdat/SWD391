import { useState } from "react";
import "./Login.css";


const Login: React.FC = props => {
    const [login, isLogin] = useState(1);

    const renderSwitch = () => {
        switch(login) {
            case 1:
                return (
                    <form className="login-form">
                        <h2 className="login-title">Login</h2>
                        <input type="text" className="login-input" placeholder="Username" />
                        <input type="password" className="login-input" placeholder="Password"/>
                        <span className="forgot" onClick={()=>isLogin(3)}>Forgot Password</span>
                        <button className="btn-login">Login Now</button>
                        <button className="btn-register" onClick={()=>isLogin(2)}>Register A New Account</button>
                    </form>
                )
                break;
            case 2:
                return (
                    <form className="login-form">
                        <h2 className="login-title">Registration</h2>
                        <input type="text" className="login-input" placeholder="Username" />
                        <input type="password" className="login-input" placeholder="Password"/>
                        <input type="password" className="login-input" placeholder="Re-enter password"/>
                        <input type="text" className="login-input" placeholder="Email" />
                        <input type="text" className="login-input" placeholder="Mobile Number" />
                        <button className="btn-login">Register</button>
                    </form>
                )
                break;
            case 3:
                return (
                    <form className="login-form">
                        <h2 className="login-title">Reset Password</h2>
                        <p className = "reset-title">Please enter the username you use to sign in</p>
                        <input type="text" className="login-input" placeholder="Username" />
                        <button className="btn-login">Reset Password</button>
                    </form>
                )
                break;
        }
    }
    
    return(
        <div id="Login">
            <h1 className="vinhome-title">Vinhomes Grand Park Marketplace</h1>
            {renderSwitch()}
        </div>
    );
}

export default Login;