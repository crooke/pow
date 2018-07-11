defmodule Authex.Phoenix.Web do
  @moduledoc """
  The entrypoint for Authex web interface.

  This can be used in as:

      use Authex.Phoenix.Web, :controller
      use Authex.Phoenix.Web, :view

  The definitions below will be executed for every view,
  controller, etc, so keep them short and clean, focused
  on imports, uses and aliases.

  Do NOT define functions inside the quoted expressions
  below. Instead, define any helper function in modules
  and import those modules here.
  """

  @spec controller :: Macro.t()
  def controller do
    quote do
      use Phoenix.Controller,
        namespace: Authex.Phoenix
    end
  end

  @spec view :: Macro.t()
  def view do
    quote do
      use Phoenix.View,
        root: "lib/authex/phoenix/templates",
        namespace: Authex.Phoenix
    end
  end

  @doc """
  When used, dispatch to the appropriate controller/view/etc.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
