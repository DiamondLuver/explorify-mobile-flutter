import { useRoutes } from "react-router-dom";
import { useAuth } from "src/context/AuthContext";
import { publicRoutes } from "./publicRoutes";
import { protectedRoutes } from "./protectedRoutes";

const Routes = () => {
    
  const { isAuthenticated } = useAuth();
  
  const routes = isAuthenticated ? protectedRoutes : publicRoutes;
  // useRoutes hook to create the routes
  const routing = useRoutes(routes);

  return routing;
};

export default Routes;
