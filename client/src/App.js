import React from 'react'
import { Route,Routes} from 'react-router-dom';
import SignUp from './components/SignUp';
import LoginForm from './components/LoginForm'
import Home from "./components/Home"

function App() {
  return (
    <div>
      <Routes>
        <Route path='/' element={<Home /> } />
        <Route path="/signup" element={< SignUp/>}/>
        <Route path="/login" element={<LoginForm />} />
      </Routes>
      
    </div>
  )
}

export default App