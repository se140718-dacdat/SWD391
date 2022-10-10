import "./Login.css";


const Login: React.FC = props => {
    return(
        <div id="Login">
            <h1 className="vinhome-title">Vinhomes Grand Park Marketplace</h1>
            <form className="login-form">
                <h2 className="login-title">Login</h2>
                <input type="text" className="login-input" placeholder="Username" />
                <input type="text" className="login-input" placeholder="Password"/>
                <a href="" className="forgot">Forgot Password</a>
                <button className="btn-login">Login Now</button>
                <button className="btn-register">Register A New Account</button>
            </form>
        </div>
    );
}

export default Login;