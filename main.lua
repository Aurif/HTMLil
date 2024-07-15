require("htmlil")

document(
    tags.body(
        tags.divColumn(
            style.width(1),
            tags.span(style.alignCenterHorizontal(), style.marginTop(60), style.marginBottom(13), style.fontSize(2), "VISIT CASINO"),
            tags.divColumn(
                style.alignCenterHorizontal(),
                tags.span("Cheap loot", style.alignCenterHorizontal(), style.marginBottom(4)),
                tags.span("Many chests", style.alignCenterHorizontal(), style.marginBottom(4)),
                tags.span("Much wow", style.alignCenterHorizontal())
            ),
            tags.span("For details contact Aurif", style.alignCenterHorizontal(), style.marginTop(30), style.marginBottom(4)),
            tags.span("or any representative of", style.alignCenterHorizontal(), style.marginBottom(4)),
            tags.span("House Inc", style.alignCenterHorizontal(), style.marginBottom(4))
        )
    )
)
