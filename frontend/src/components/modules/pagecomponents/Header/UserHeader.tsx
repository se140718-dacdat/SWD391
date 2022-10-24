import Container from 'react-bootstrap/Container';
import React, { useState } from 'react';
import { useNavigate } from "react-router-dom";
import 'bootstrap/dist/css/bootstrap.min.css';
import "./UserHeader.css";
import { useDispatch, useSelector } from "react-redux";
import { Nav, Navbar, OverlayTrigger, Tooltip, NavDropdown, Dropdown } from 'react-bootstrap';
import { logoutUser } from '../../../../redux/apiRequest';
const UserHeader: React.FC = props => {
    const user = useSelector((state: any) => state.auth.login.currentUser.data);
    const accessToken = user?.jwtToken;
    const username = user?.fullName;
    const dispatch = useDispatch();
    const navigate = useNavigate();
    const logout = () => {
        logoutUser(dispatch, username, navigate, accessToken);
    }
    const [show, setShow] = useState("display-none");
    const renderTooltip = (props: String) => (
        <Tooltip id="button-tooltip" {...props}>
            {props}
        </Tooltip>
    );
    return (
        <div id="UserHeader">
            <Navbar className="header-navbar" collapseOnSelect expand="lg" bg="light" variant="light">
                <Container>
                    <Navbar.Brand href="#home"><img className="vin-icon" src="/images/vin-icon.jpg"></img></Navbar.Brand>
                    <Navbar.Collapse id="responsive-navbar-nav">
                        <Nav className="me-auto">
                            <Nav.Link href="/">Home</Nav.Link>
                            <Nav.Link href="/create-post">Post</Nav.Link>
                        </Nav>
                        <Nav className="search">
                            <i className="pi pi-search"></i>
                            <input type="search" className="search-bar" placeholder='Search...' />
                        </Nav>
                        <Nav className="nav-icon">
                            <OverlayTrigger
                                placement="bottom"
                                delay={{ show: 250, hide: 400 }}
                                overlay={renderTooltip("Messages")}
                            >
                                <i className="pi pi-inbox"></i>
                            </OverlayTrigger>
                        </Nav>
                        <Nav className="nav-icon">
                            <OverlayTrigger
                                placement="bottom"
                                delay={{ show: 250, hide: 400 }}
                                overlay={renderTooltip("Notifications")}
                            >
                                <i className="pi pi-bell"></i>
                            </OverlayTrigger>
                        </Nav>
                        <Nav className="nav-icon">
                            <OverlayTrigger
                                placement="bottom"
                                delay={{ show: 250, hide: 400 }}
                                overlay={renderTooltip("Cart")}
                            >
                                <i className="pi pi-shopping-cart"></i>
                            </OverlayTrigger>
                        </Nav>
                        <Nav className='user-wrap' onClick={() => {
                            (show == "") ?
                                setShow("display-none")
                                : setShow("")
                        }}>
                            <span className='user-name'>{username}</span>
                            <img src="/images/user-avt.png" alt="user-avt" className='user-avt' />
                            <div className={`user-option ${show}`}>
                                <div className="user-info">
                                    <img src="/images/user-avt.png" alt="user-avt" className='user-info-avt' />
                                    <div className='block'>
                                        <span className='user-info-name'>{username}</span>
                                        <span className='user-info-email'>datlhdse140718@fpt.edu.vn</span>
                                    </div>
                                </div>
                                <button className="btn-logout" onClick={() => { logout() }}>Logout</button>
                            </div>
                        </Nav>
                    </Navbar.Collapse>
                </Container>
            </Navbar>
            {/* <Modal show={show} onHide={handleClose}>
                <Modal.Header closeButton>
                    <Modal.Title>Login</Modal.Title>
                </Modal.Header>
                <Modal.Body>
                    <Form>
                        <Form.Group className="mb-3" controlId="exampleForm.ControlInput1">
                            <Form.Label>Email address</Form.Label>
                            <Form.Control
                                type="email"
                                placeholder="Email address"
                                autoFocus
                            />
                        </Form.Group>
                        <Form.Group className="mb-3" controlId="exampleForm.ControlInput2">
                            <Form.Label>Password</Form.Label>
                            <Form.Control
                                type="email"
                                placeholder="Password"
                                autoFocus
                            />
                        </Form.Group>
                    </Form>
                </Modal.Body>
                <Modal.Footer>
                    <Button variant="secondary" onClick={handleClose}>
                        Close
                    </Button>
                    <Button style={{ backgroundColor: "#606099", border: "none", padding: "6px 20px" }} variant="primary" onClick={handleClose}>
                        Login
                    </Button>
                </Modal.Footer>
            </Modal> */}
        </div>
    );
}

export default UserHeader;
