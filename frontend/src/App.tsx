import React, { useState } from 'react';
import "primeicons/primeicons.css";
import './App.css';
import { BrowserRouter, Routes, Route, Navigate } from 'react-router-dom';
import AdminHeader from './components/modules/pagecomponents/Admin/AdminHeader/AdminHeader';
import Header from './components/modules/pagecomponents/Header/Header';
import Menu from './components/modules/pagecomponents/Menu/Menu';
import Main from './components/pages/Product/Main';
import Login from './components/pages/Login/Login';
import Product from './components/pages/Product/Product';
import CreatePost from './components/pages/Post/CreatePost';
import UserHeader from './components/modules/pagecomponents/Header/UserHeader';
import { useSelector } from 'react-redux';
import Filter from './components/pages/Product/Filter';

function App() {
  const user = useSelector((state: any) => state.auth.login.currentUser);
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
            </div>
          )
        })()}
        <Routes>
          <Route path='/login' element={<Login />}></Route>
          <Route path='/' element={<Main />}></Route>
          <Route path='/:id' element={<Filter />}></Route>
          <Route path='/product' element={<Product />}></Route>
          <Route path='/create-post' element={<CreatePost />}></Route>
        </Routes>
      </BrowserRouter>

    </div>
  );
}

export default App;
