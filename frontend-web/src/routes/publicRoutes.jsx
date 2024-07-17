import Login from "src/pages/Auth/Login";
import Register from "src/pages/Auth/Register";

export const publicRoutes = [
  {
    path: "/login",
    element: <Login />,
  },
  {
    path: "/register",
    element: <Register />,
  },
  // Add more public routes here
];
