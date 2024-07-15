require("htmlil")

function footnote(text)
    return tags.span(text, style.alignCenterHorizontal(), style.fontColor(0x888888))
end

document(
    tags.body(
        tags.divColumn(
            style.width(1),
            tags.span(style.alignCenterHorizontal(), style.marginTop(60), style.marginBottom(26), style.fontSize(2), "VISIT CASINO"),
            tags.divColumn(
                style.alignCenterHorizontal(),
                tags.span("Cheap loot", style.alignCenterHorizontal(), style.marginBottom(4)),
                tags.span("Many chests", style.alignCenterHorizontal(), style.marginBottom(4)),
                tags.span("Much wow", style.alignCenterHorizontal()),
                style.marginBottom(26)
            ),
            footnote("For details contact Aurif"),
            footnote("or any representative of"),
            footnote("House Inc")
        )
    )
)
