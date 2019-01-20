Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,1/3] dma: imx-sdma: fix NULL pointer de-reference
From: Daniel Baluta <daniel.baluta@gmail.com>
Message-Id: <CAEnQRZDzvmn-6YyoQRrWbkbH8d1ej8aFE1wFAiXQtqzHxyW2eA@mail.gmail.com>
Date: Sun, 20 Jan 2019 11:54:28 +0200
To: "Angus Ainslie (Purism)" <angus@akkea.ca>
Cc: Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-ID: <dmaengine.vger.kernel.org>

T24gU3VuLCBKYW4gMjAsIDIwMTkgYXQgNDozNCBBTSBBbmd1cyBBaW5zbGllIChQdXJpc20pIDxh
bmd1c0Bha2tlYS5jYT4gd3JvdGU6Cj4KPiBPbiB0aGUgaW14OG1xIEkgZ2V0IE5VTEwgcG9pbnRl
ciBkZS1kZWZlcmVuY2UgZXJyb3JzIGlmIHRoZSBkZXZpY2UKPiBpc24ndCBwYXNzZWQgaW4gZHVy
aW5nIGFsbG9jYXRpb24uCj4KPiBTaWduZWQtb2ZmLWJ5OiBBbmd1cyBBaW5zbGllIChQdXJpc20p
IDxhbmd1c0Bha2tlYS5jYT4KCkhpIEFuZ3VzLAoKSSBoYXZlIGFscmVhZHkgc2VudCBhIGZpeCBm
b3IgdGhpczoKCmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTA3NTgyMDMvCg==
