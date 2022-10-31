import Container from 'react-bootstrap/Container';
import React, { useState, useEffect } from 'react';
import { useNavigate } from "react-router-dom";
import 'bootstrap/dist/css/bootstrap.min.css';
import "./UserHeader.css";
import { useDispatch, useSelector } from "react-redux";
import { Nav, Navbar, OverlayTrigger, Tooltip, NavDropdown, Dropdown } from 'react-bootstrap';
import { logoutUser } from '../../../../redux/apiRequest';
const UserHeader: React.FC = props => {
    const user = useSelector((state: any) => state.auth.login.currentUser.data);
    const dispatch = useDispatch();
    const navigate = useNavigate();
    const logout = () => {
        logoutUser(dispatch, navigate);
    }

    const renderNotification = (name: string) => {
        return (
            <div className="notification-body">
                <ul className="cart-body">
                    <li className="cart-item-wrap">
                        <a href="" className="cart-item">
                            <img src="https://cdn.shopify.com/s/files/1/0814/0539/products/p191213_Barrel_46_Whiskey_Espresso_1123_1080px_600x.jpg?v=1666056574" style = {{width: "36px", height: "36px"}} alt="" className="item-img" />
                            <span className="item-name">Rosewood Watch</span>
                        </a>
                        <span className="item-quantity">1 × $165.00</span>
                        <a href="" className="item-remov">x</a>
                    </li>
                </ul>
            </div>
        )
    }

    const showModal = (name: string) => {
        const element = document.getElementsByClassName(name)[0].classList;
        if (element.contains('display')) {
            element.remove('display');
            console.log(`element: ${element}`);
        } else {
            element.add('display');
            console.log(`element: ${element}`);
        }
    }

    const notifications = [
        {
            name: "Messages",
            icon: "pi pi-inbox",
            title: "Messages",
            link: "display-none"
        },
        {
            name: "Notifications",
            icon: "pi pi-bell",
            title: "Notifications",
            link: "display-none"
        },
        {
            name: "Cart",
            icon: "pi pi-shopping-cart",
            title: "Shopping Cart",
            link: "View Cart",
            redirect: "/cart"
        }
    ]
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
                        {
                            notifications.map((item, index) => {
                                return (
                                    <Nav key={index} className="nav-icon" onClick={() => { showModal(`${index}`) }}>
                                        <OverlayTrigger
                                            placement="bottom"
                                            delay={{ show: 250, hide: 400 }}
                                            overlay={renderTooltip(item.name)}
                                        >
                                            <i className={item.icon}></i>
                                        </OverlayTrigger>
                                        <div className={`notification-modal ${index}`}>
                                            <div className="notification-header">
                                                <h2 className="notification-title">{item.title}</h2>
                                                <a href={item.redirect} className={`notification-link ${item.link}`}>{item.link}</a>
                                            </div>
                                            {renderNotification(item.name)}
                                        </div>
                                    </Nav>
                                )
                            })
                        }

                        <Nav className='user-wrap' onClick={() => {
                            (show == "") ?
                                setShow("display-none")
                                : setShow("")
                        }}>
                            <span className='user-name'>{user.fullName}</span>
                            <img src={user.avatarUrl} alt="user-avt" className='user-avt' />
                            <div className={`user-option ${show}`}>
                                <div className="user-info">
                                    <img src={user.avatarUrl} alt="user-avt" className='user-info-avt' />
                                    <div className='block'>
                                        <span className='user-info-name'>{user.fullName}</span>
                                        <span className='user-info-email'>{user.description}</span>
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
