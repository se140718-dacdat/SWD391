import "./Login.css";


const Login: React.FC = props => {
    return(
        <div id="Login">
            <h1 className="login-title">Vinhomes Grand Park Marketplace</h1>
            <form className="login-form">
                <input type="text" className="login-input" placeholder="Username" />
                <input type="text" className="login-input" placeholder="Password"/>
                <button className="btn-login">Login</button>
            </form>
        </div>
    );
}

export default Login;