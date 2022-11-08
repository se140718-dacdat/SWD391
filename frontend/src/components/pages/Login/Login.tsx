import { useState, FormEvent, useEffect } from "react";
import { getBuidings, loginUser, registerUser } from "../../../redux/apiRequest";
import "./Login.css";
import { useDispatch } from 'react-redux';
import { useNavigate } from 'react-router-dom';
import { Form } from "react-bootstrap";
import { Building } from "../../../model";

const Login: React.FC = props => {
    const [username, setUsername] = useState('');
    const [password, setPassword] = useState('');
    const [rePassword, setRePassword] = useState('');
    const [phone, setPhone] = useState('');
    const [selectBuilding, setSelectBuilding] = useState('');
    const [fullName, setFullname] = useState('');
    const [avatarUrl, setAvatarUrl] = useState('');
    const [gender, setGender] = useState('');
    const [description, setDescription] = useState('');
    const [buildings, setBuildings] = useState<Building[]>([]);
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

    const handleSubmit = (e: FormEvent) => {
        e.preventDefault();
        if (password == rePassword) {
            const newUser = {
                username: username,
                password: password,
                fullName: fullName,
                description: description,
                phone: phone,
                gender: gender,
                avatarUrl: avatarUrl,
                buildingId: selectBuilding
            }
            console.log(newUser);
            registerUser(newUser);
            isLogin(1);
            alert('Registered!');
        }
        else {
            alert('Passwords do not match');
        }
    }

    useEffect(() => {
        fetchData();
    }, []);

    async function fetchData() {
        try {
            const res = await fetch("http://nguyenxuanthuan-001-site1.htempurl.com/api/buildings");
            const data = await res.json();
            setBuildings(data.data);
        } catch (error) {
            return error;
        }
    }


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
                    <form className="login-form" onSubmit={handleSubmit}>
                        <h2 className="login-title">Registration</h2>
                        <input type="text" className="login-input" placeholder="Username" onChange={(e) => setUsername(e.target.value)} />
                        <input type="password" className="login-input" placeholder="Password" onChange={(e) => setPassword(e.target.value)} />
                        <input type="password" className="login-input" placeholder="Re-enter password" onChange={(e) => setRePassword(e.target.value)} />
                        <input type="text" className="login-input" placeholder="Fullname" onChange={(e) => setFullname(e.target.value)} />
                        <input type="text" className="login-input" placeholder="Avatar URL" onChange={(e) => setAvatarUrl(e.target.value)} />
                        <input type="text" className="login-input" placeholder="Mobile Number" onChange={(e) => setPhone(e.target.value)} />
                        <input type="text" className="login-input" placeholder="Desciption" onChange={(e) => setDescription(e.target.value)} />
                        <Form.Select onChange={(e) => setGender(e.target.value)} style={{ marginBottom: "24px" }} >
                            <option>Select Your Gender</option>
                            <option value="Male">Male</option>
                            <option value="Female">Female</option>
                        </Form.Select>
                        <Form.Select onChange={(e) => setSelectBuilding(e.target.value)} >
                            <option>Select Your Building</option>
                            {
                                buildings?.map((item, index) => {
                                    return (
                                        <option key={index} value={item.id}>{item.name + " " + item.address}</option>
                                    )
                                })
                            }
                        </Form.Select>
                        <button type="submit" className="btn-login">Register</button>
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