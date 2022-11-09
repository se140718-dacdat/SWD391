import Container from 'react-bootstrap/Container';
import React, { useState, useEffect } from 'react';
import { useNavigate } from "react-router-dom";
import 'bootstrap/dist/css/bootstrap.min.css';
import '../../Header/UserHeader.css';
import { useDispatch, useSelector } from "react-redux";
import { Nav, Navbar, OverlayTrigger, Tooltip, NavDropdown, Dropdown } from 'react-bootstrap';
import { logoutUser } from '../../../../../redux/apiRequest';
import { currencyMaskString } from '../../../../../mask';

const AdminHeader: React.FC = props => {
    const user = useSelector((state: any) => state.user.user.currentUser);
    const cart = useSelector((state: any) => state.cart.cart.currentCart);
    const dispatch = useDispatch();
    const navigate = useNavigate();
    const [show, setShow] = useState("display-none");
    const logout = () => {
        logoutUser(dispatch, navigate);
    }

    const showModal = (name: string) => {
        const element = document.getElementsByClassName(name)[0].classList;
        if (element.contains('display')) {
            element.remove('display');
        } else {
            element.add('display');
        }
    }


    return (
        <div id="UserHeader">
            <Navbar className="header-navbar" collapseOnSelect expand="lg" bg="light" variant="light">
                <Container>
                    <Navbar.Brand href="#home"><img className="vin-icon" src="/images/vin-icon.jpg"></img></Navbar.Brand>
                    <Navbar.Collapse id="responsive-navbar-nav">
                        <Nav className="me-auto">
                            <Nav.Link className='link' href="/">Account</Nav.Link>
                            <Nav.Link className='link' href="/building">Building</Nav.Link>
                            <Nav.Link className='link' href="/category">Category</Nav.Link>
                        </Nav>
                        <Nav className='user-wrap'>
                            <button className="btn-logout btn-primary-color" onClick={() => { logout() }}>Logout</button>
                        </Nav>
                    </Navbar.Collapse>
                </Container>
            </Navbar>
        </div>
    );
}

export default AdminHeader;
