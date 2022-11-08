import Container from 'react-bootstrap/Container';
import React, { useState, useEffect } from 'react';
import { useNavigate } from "react-router-dom";
import 'bootstrap/dist/css/bootstrap.min.css';
import "./UserHeader.css";
import { useDispatch, useSelector } from "react-redux";
import { Nav, Navbar, OverlayTrigger, Tooltip, NavDropdown, Dropdown } from 'react-bootstrap';
import { clearCart, logoutUser } from '../../../../redux/apiRequest';
import { cartItem, getTotal, Post, PostShow, Product } from '../../../../model';
import { currencyMask, currencyMaskString } from '../../../../mask';

const UserHeader: React.FC = props => {
    const user = useSelector((state: any) => state.auth.login.currentUser.data);
    const cart = useSelector((state: any) => state.cart.cart.currentCart);
    const dispatch = useDispatch();
    const navigate = useNavigate();
    const [show, setShow] = useState("display-none");
    const logout = () => {
        logoutUser(dispatch, navigate);
    }
    const [showCart, isShowCart] = useState("display-none");

    useEffect(() => {
        if (cart?.length > 0) {
            isShowCart("");
        } else {
            isShowCart("display-none");
        }
    });


    const renderNotification = (name: string) => {
        if (name == "Cart") {
            return (
                <div className="notification-body">
                    <ul className="cart-body">
                        {
                            cart?.map((item: cartItem, index: number) => {
                                return (
                                    <li key={index} className="cart-item-wrap">
                                        <a href="" className="cart-item">
                                            <img src={item?.post.imageUrl} style={{ width: "36px", height: "36px" }} alt="" className="item-img" />
                                            <span className="item-name">{item?.post.product.name}</span>
                                        </a>
                                        <div>
                                            <span className="item-quantity">{`${item?.quantity} × $${currencyMaskString(item?.post.product.price)}`}</span>
                                            <a href="" className="item-remove fs-16">×</a>
                                        </div>
                                    </li>
                                )
                            })
                        }
                    </ul>
                    <div className="cart-footer">
                        <div className='total'><strong>Total: </strong>{`$${currencyMaskString(getTotal(cart))}`}</div>
                        <button className="btn-checkout btn-primary-color"
                            onClick={
                                () => {
                                    navigate("/cart")
                                }
                            }
                        >Checkout</button>
                    </div>
                </div>
            )
        }
        else {
            return (
                <div></div>
            )
        }
    }

    const showModal = (name: string) => {
        const element = document.getElementsByClassName(name)[0].classList;
        if (element.contains('display')) {
            element.remove('display');
        } else {
            element.add('display');
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
                            <Nav.Link className='link' href="/">Home</Nav.Link>
                            <Nav.Link className='link' href="/create-post">Post</Nav.Link>
                            <Nav.Link className='link' href="/store">Store</Nav.Link>
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
                                        <div className={`cart-length ${item.link} ${showCart}`}>{cart?.length}</div>
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
                                <div className="wallet">
                                    000 <i className='pi pi-money-bill'></i>
                                </div>
                                <button className="btn-logout btn-primary-color" onClick={() => { logout() }}>Logout</button>
                            </div>
                        </Nav>
                    </Navbar.Collapse>
                </Container>
            </Navbar>
        </div>
    );
}

export default UserHeader;
