import React, { useEffect } from 'react';
import "primeicons/primeicons.css";
import './App.css';
import { BrowserRouter, Routes, Route, Navigate } from 'react-router-dom';
import AdminHeader from './components/modules/pagecomponents/Admin/AdminHeader/AdminHeader';
import Header from './components/modules/pagecomponents/Header/Header';
import Menu from './components/modules/pagecomponents/Menu/Menu';
import Main from './components/pages/Product/Main';
import Login from './components/pages/Login/Login';
import CreatePost from './components/pages/Post/CreatePost';
import UserHeader from './components/modules/pagecomponents/Header/UserHeader';
import { useDispatch, useSelector } from 'react-redux';
import Filter from './components/pages/Product/Filter';
import Cart from './components/pages/Cart/Cart';
import ProductPage from './components/pages/Product/ProductPage';
import Store from './components/pages/Product/Store';
import Profile from './components/pages/Profile/Profile';
import { getUser } from './redux/apiRequest';
import Order from './components/pages/Order/Order';

function App() {
  const dispatch = useDispatch();
  const user = useSelector((state: any) => state.auth.login.currentUser);

  useEffect(() => {
    fetchData();
  }, [])

  async function fetchData() {
    try {
        if(user) {
          getUser(user?.data.id, user?.data.jwtToken, dispatch);
        }
    } catch (error) {
        return error;
    }
}

  const renderAuth = () => {
    switch (user?.data.role) {
      case "USER":
        return <UserHeader />
      case "ADMIN":
        return <AdminHeader />;
      default:
        return <Header />;
    }
  }
  return (
    <div id="App">
      <BrowserRouter>
        {(() => {
          return (
            <div>
              {renderAuth()}
              <Menu />
              <Routes>
                <Route path='/login' element={<Login />}></Route>
                <Route path='/' element={<Main />}></Route>
                <Route path='/order' element={<Order />}></Route>
                <Route path='/:id' element={<Main />}></Route>
                <Route path='/product' element={<ProductPage />}></Route>
                <Route path='/cart' element={<Cart />}></Route>
                <Route path='/profile' element={<Profile />}></Route>
                <Route path='/create-post' element={<CreatePost />}></Route>
                <Route path='/store' element={<Store />}></Route>
              </Routes>
            </div>
          )
        })()}

      </BrowserRouter>

    </div>
  );
}

export default App;
