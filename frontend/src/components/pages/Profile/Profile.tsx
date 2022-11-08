import { FormEvent, useEffect, useState } from "react";
import { Form } from "react-bootstrap";
import {  useSelector } from "react-redux";
import { Building, editProfile } from "../../../model";
import { loginUser } from "../../../redux/apiRequest";
import './Profile.css';

const Profile = () => {
    const user = useSelector((state: any) => state.auth.login.currentUser.data);
    const [edit, isEdit] = useState<boolean>(false);
    const [phone, setPhone] = useState(user.phone);
    const [selectBuilding, setSelectBuilding] = useState(user.building);
    const [fullName, setFullname] = useState(user.fullName);
    const [password, setPassword] = useState('');
    const [avatarUrl, setAvatarUrl] = useState(user.avatarUrl);
    const [gender, setGender] = useState(user.gender);
    const [description, setDescription] = useState(user.description);
    const [buildings, setBuildings] = useState<Building[]>([]);
    useEffect(() => {
        fetchData();
    }, [edit]);

    async function fetchData() {
        try {
            const res = await fetch("http://nguyenxuanthuan-001-site1.htempurl.com/api/buildings");
            const data = await res.json();
            setBuildings(data.data);
        } catch (error) {
            return error;
        }
    }

    async function editProfile() {
        try {
            const response = await fetch(`http://nguyenxuanthuan-001-site1.htempurl.com/api/accounts/${user.id}`, {
                method: 'PUT',
                headers: {
                    Authorization: `Bearer ${user?.jwtToken}`,
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    id: user.id,
                    password: password,
                    fullName: fullName,
                    description: description,
                    phone: phone,
                    gender: gender,
                    avatarUrl: avatarUrl,
                    buildingId: selectBuilding
                })
            });
        } catch (error) {
            console.log(error);
        }
    }

    const handleEdit = (e: FormEvent) => {
        e.preventDefault();
        editProfile();
    }

    const render = () => {
        if (!edit) {
            return (
                <div className="user-wrap">
                    <button className="btn-edit btn-primary-color" onClick={() => { isEdit(true) }}><i className="pi pi-user-edit" style={{ marginRight: '8px' }}></i>Edit profile</button>
                    <img className="user-avt" src={user.avatarUrl} alt="" />
                    <div className="user-react">
                        <div className="">
                            <span className="number">22</span>
                            <span className="react-number">Posts</span>
                        </div>
                        <div className="">
                            <span className="number">22</span>
                            <span className="react-number">Sell</span>
                        </div>
                        <div className="">
                            <span className="number">22</span>
                            <span className="react-number">Like</span>
                        </div>
                    </div>
                    <h1 className="user-name">{user.fullName}</h1>
                    <div className="user-building">{user.building.name}-{user.building.address}</div>
                    <div className="user-about">{user.phone}</div>
                </div>
            )
        } else {
            return (
                <div className="user-wrap">
                    <button className="btn-edit btn-primary-color" onClick={() => { isEdit(false) }}><i className="pi pi-user" style={{ marginRight: '8px' }}></i>View My Profile</button>
                    <h1 className="edit-title">Edit Information</h1>
                    <div className="user-edit">
                        <div className="edit-input">
                            <span>Full Name</span>
                            <input type="text" placeholder="Fullname" onChange={(e) => setFullname(e.target.value)} />
                        </div>
                        <div className="edit-input">
                            <span>Password</span>
                            <input type="password" placeholder="Password" onChange={(e) => setPassword(e.target.value)} />
                        </div>
                        <div className="edit-input">
                            <span>Avatar URL</span>
                            <input type="text" placeholder="Avatar URL" onChange={(e) => setAvatarUrl(e.target.value)} />
                        </div>
                        <div className="edit-input">
                            <span>Phone</span>
                            <input type="text" placeholder="Mobile Number" onChange={(e) => setPhone(e.target.value)} />
                        </div>

                        <div className="edit-input">
                            <span>Gender</span>
                            <Form.Select onChange={(e) => setGender(e.target.value)} style={{ marginBottom: "24px" }} >
                                <option>Select Your Gender</option>
                                <option value="Male">Male</option>
                                <option value="Female">Female</option>
                            </Form.Select>
                        </div>
                        <div className="edit-input">
                            <span>Building</span>
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
                        </div>
                        <div className="edit-input">
                            <span>Description</span>
                            <input type="text" placeholder="Desciption" onChange={(e) => setDescription(e.target.value)} />
                        </div>
                        <div className="float-right">
                            <button className="btn-primary-color" onClick={(e) => { handleEdit(e) }}>Save Changes</button>
                        </div>
                    </div>
                </div>
            )
        }
    }

    return (
        <div id="Profile" className="right-side">
            {render()}
        </div>
    )
}
export default Profile;