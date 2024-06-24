const std = @import("std");

const rl = @cImport({
    @cInclude("raylib.h");
});

pub fn main() void
{
    rl.InitWindow(800, 450, "raylib [core] example - basic window");
    defer rl.CloseWindow();

    while (!rl.WindowShouldClose()) {
        rl.BeginDrawing();
        defer rl.EndDrawing();

        rl.ClearBackground(rl.RAYWHITE);
        rl.DrawText("Congrats! You created your first window!", 190, 200, 20, rl.LIGHTGRAY);
    }
}
