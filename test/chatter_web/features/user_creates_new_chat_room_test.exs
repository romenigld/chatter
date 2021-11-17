defmodule ChatterWeb.UserCreatesNewChatRoomTest do
  use ChatterWeb.FeatureCase, async: true

  test "user creates a new chat room successfully", %{session: session} do
    session
    # |> visit(Routes.chat_room_path(@endpoint, :index))
    |> visit(rooms_index())
    # |> click(Query.link("New chat room"))
    |> click(new_chat_link())
    # |> fill_in(Query.text_field("Name"), with: "elixir")
    # |> click(Query.button("Submit"))
    |> create_chat_room(name: "elixir")
    # |> assert_has(Query.data("role", "room-title", text: "elixir"))
    |> assert_has(room_title("elixir"))
  end

  defp rooms_index, do: Routes.chat_room_path(@endpoint, :index)

  defp new_chat_link, do: Query.link("New chat room")

  defp create_chat_room(session, name: name) do
    session
    |> fill_in(Query.text_field("Name"), with: name)
    |> click(Query.button("Submit"))
  end

  defp room_title(title) do
    Query.data("role", "room-title", text: title)
  end
end
