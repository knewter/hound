defmodule Hound.JsonDriver.Cookie do
  @moduledoc "Provides cookie-related functions."

  import Hound.JsonDriver.Utils


  @doc """
  Gets cookies. Returns a list of ListDicts, each containing properties of the cookie.

      get_cookies()
  """
  @spec cookies() :: List.t
  def cookies() do
    session_id = Hound.get_current_session_id
    make_req(:get, "session/#{session_id}/cookie")
  end


  @doc """
  Sets cookie.

      set_cookie([name: "cart_id", value: 123213])
      set_cookie([name: "cart_id", value: "23fa0ev5a6er", secure: true])

  Accepts a ListDict with the following keys:

  * name (string) - REQUIRED
  * value (string) - REQUIRED
  * path (string)
  * domain (string)
  * secure (boolean)
  * expiry (integer, specified in seconds since midnight, January 1, 1970 UTC)
  """
  @spec set_cookie(Dict.t) :: :ok
  def set_cookie(cookie) do
    session_id = Hound.get_current_session_id
    make_req(:post, "session/#{session_id}/cookie", [cookie: cookie])
  end

  @doc "Delete all cookies"
  @spec delete_cookies() :: :ok
  def delete_cookies() do
    session_id = Hound.get_current_session_id
    make_req(:delete, "session/#{session_id}/cookie")
  end

  @doc "Delete a cookie with the given name"
  @spec delete_cookie(String.t) :: :ok
  def delete_cookie(name) do
    session_id = Hound.get_current_session_id
    make_req(:delete, "session/#{session_id}/cookie/#{name}")
  end
end
