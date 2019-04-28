﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Models;
using System.Web.Script.Serialization;
using System.Data;

namespace Roles
{
    public partial class WebServiceRoles : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string content = "null";

            Response.Clear();
            Response.ClearHeaders();

            // Requests
            if (Request["editRole"] != null)
                content = UpdateRole(int.Parse(Request["idRol"]), Request["roleName"]);

            if (Request["getAllRoles"] != null)
                content = GetAllRoles();

            if (Request["deleteRole"] != null)
                content = DeleteRole(int.Parse(Request["idRol"]));

            if (Request["insertRole"] != null)
                content = InsertRole(Request["newRole"]);

            if (Request["assignRole"] != null)
                content = AssignRole(int.Parse(Request["idRol"]), int.Parse(Request["idUsuario"]));

            if (Request["getAllUsersRoles"] != null)
                content = GetAllUsersRoles();

            if (Request["unassignRole"] != null)
                content = UnassignRole(int.Parse(Request["idUser"]), int.Parse(Request["idRole"]));

            if (Request["getRole"] != null)
                content = GetRole(int.Parse(Request["idRol"]));

            if (Request["getAllUsersAssociated"] != null)
                content = GetAssociatedUsers(int.Parse(Request["idRol"]));

            if (Request["unassignUser"] != null)
                content = UnassignUser(int.Parse(Request["idRol"]), int.Parse(Request["idUser"]));

            if (Request["getAllModules"] != null)
                content = GetAllModules();
            if (Request["Testing"] != null)
                content = "True";

            Response.Write(content);
            Response.Flush();
            Response.End();
        }

        /// <summary>
        /// Modifica un rol
        /// </summary>
        /// <param name="id">Id del rol</param>
        /// <param name="newRole">Nuevo string del rol</param>
        /// <returns>Devuelve un string "True" si se modificó, "False" si no.</returns>
        private string UpdateRole(
            int id,
            string newRole)
        {
            Mod_Roles r = Mod_Roles.Get_ById(id);
            if (r != null)
            {
                #region return deprecated
                //if (r.Update(newRole) == true)
                //{
                //    return true.ToString();
                //}
                //else
                //{
                //    return false.ToString();
                //}
                #endregion

                return (r.Update(newRole)) ? true.ToString() : false.ToString();
            }
            else
                return false.ToString();            
        }

        /// <summary>
        /// Obtiene todos los roles
        /// </summary>
        /// <returns>Devuelve una lista con todos los roles</returns>
        private string GetAllRoles()
        {
            return new JavaScriptSerializer().Serialize(Mod_Roles.Get_All());
        }

        /// <summary>
        /// Elimina un rol de la tabla
        /// </summary>
        /// <param name="id">Id del rol</param>
        /// <param name="role">Nombre del rol</param>
        /// <returns>Devuelve un string "True" si se eliminó, "False" si no.</returns>
        private string DeleteRole(
            int id)
        {

            Mod_Roles r = Mod_Roles.Get_ById(id);            

            return r.Delete().ToString();
        }

        /// <summary>
        /// Inserta un rol en la tabla
        /// </summary>
        /// <param name="role">String del nuevo rol</param>
        /// <returns>Devuelve un string "True" si se creó, "False" si no.</returns>
        private string InsertRole(string role)
        {
            #region return deprecated
            //    if (Mod_Roles.Insert(role) != null)
            //        return "True";
            //    else
            //        return "False";
            #endregion

            if (Mod_Roles.Get_ByName(role) != null)
                return "Ya existe un rol con ese nombre.";
            else
                return (Mod_Roles.Insert(role) != null) ? "True" : "False";

        }

        /// <summary>
        /// Asigna un rol a un usuario
        /// </summary>
        /// <param name="idRole">Id del rol</param>
        /// <param name="idUser">Id de usuario</param>
        /// <returns>Devuelve un string "True" si se asignó, "False" si no.</returns>
        private string AssignRole(
            int idRole,
            int idUser)
        {
            Mod_Users user = Mod_Users.Get_ById(idUser);
            bool exists = false;

            if(user.ROLES != null)
            {
                for (int a = 0; a < user.ROLES.Count; a++)
                {
                    if (user.ROLES[a].ID == idRole)
                    {
                        exists = true;
                    }
                }
            }
            
            return exists ? "El usuario ya tiene ese rol asignado. Elija otro." : user.AddRole(idRole).ToString();
        }

        /// <summary>
        /// Obtiene todos los usuarios y roles
        /// </summary>
        /// <returns>Devuelve una lista de objetos 'Mod_Users' serializada en JSON</returns>
        private string GetAllUsersRoles()
        {            
            return new JavaScriptSerializer().Serialize(Mod_Users.Get_All());
        }

        /// <summary>
        /// Desasigna un rol de un usuario
        /// </summary>
        /// <param name="idUser">Id de usuario</param>
        /// <param name="idRole">Id de rol</param>
        /// <returns>Devuelve un string "True" si se desasignó, "False" sino</returns>
        private string UnassignRole(
            int idUser,
            int idRole)
        {
            return Mod_Users.Get_ById(idUser).RemoveRole(idRole).ToString();
        }

        /// <summary>
        /// Busca un único rol por su id
        /// </summary>
        /// <param name="idRole">Id del rol</param>
        /// <returns>Devuelve un string del objeto serializado a json</returns>
        private string GetRole(int idRole)
        {
            return new JavaScriptSerializer().Serialize(Mod_Roles.Get_ById(idRole));
        }

        /// <summary>
        /// Busca los usuarios asociados a un rol
        /// </summary>
        /// <param name="idRole">Id del rol</param>
        /// <returns>Devuelve un string serializado en json con una lista de Mod_Users.</returns>
        private string GetAssociatedUsers(int idRole)
        {
            Mod_Roles role = Mod_Roles.Get_ById(idRole);
            return new JavaScriptSerializer().Serialize(role.GetUsers());

        }

        /// <summary>
        /// Desasigna un usuario de un rol
        /// </summary>
        /// <param name="idRole">idRol</param>
        /// <param name="idUser">idUsuario</param>
        /// <returns>Devuelve un string "True" si se desasignó, "False" sino</returns>
        private string UnassignUser(
            int idRole,
            int idUser)
        {
            return Mod_Users.Get_ById(idUser).RemoveRole(idRole).ToString();
        }

        private string GetAllModules()
        {
            return new JavaScriptSerializer().Serialize(Mod_Modules.Get_All());
        }
    }
}