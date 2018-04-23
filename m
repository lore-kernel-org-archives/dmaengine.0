Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [PATCH/RFC,7/8] ARM: shmobile: Remove the ARCH_SHMOBILE Kconfig symbol
From: Simon Horman <horms@verge.net.au>
Message-Id: <20180423092917.h24b2gem6j24uhnk@verge.net.au>
Date: Mon, 23 Apr 2018 11:29:18 +0200
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vinod.koul@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, "David S . Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Arnd Bergmann <arnd@arndb.de>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org, linux-media@vger.kernel.org, netdev@vger.kernel.org, devel@driverdev.osuosl.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
List-ID: <dmaengine.vger.kernel.org>

T24gRnJpLCBBcHIgMjAsIDIwMTggYXQgMDM6Mjg6MzNQTSArMDIwMCwgR2VlcnQgVXl0dGVyaG9l
dmVuIHdyb3RlOgo+IEFsbCBkcml2ZXJzIGZvciBSZW5lc2FzIEFSTSBTb0NzIGhhdmUgZ2FpbmVk
IHByb3BlciBBUkNIX1JFTkVTQVMKPiBwbGF0Zm9ybSBkZXBlbmRlbmNpZXMuICBIZW5jZSBmaW5p
c2ggdGhlIGNvbnZlcnNpb24gZnJvbSBBUkNIX1NITU9CSUxFCj4gdG8gQVJDSF9SRU5FU0FTIGZv
ciBSZW5lc2FzIDMyLWJpdCBBUk0gU29DcywgYXMgc3RhcnRlZCBieSBjb21taXQKPiA5YjViYTBk
ZjRlYTRmOTQwICgiQVJNOiBzaG1vYmlsZTogSW50cm9kdWNlIEFSQ0hfUkVORVNBUyIpLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIu
YmU+Cj4gLS0tCj4gVGhpcyBkZXBlbmRzIG9uIHRoZSBwcmV2aW91cyBwYXRjaGVzIGluIHRoaXMg
c2VyaWVzLCBoZW5jZSB0aGUgUkZDLgoKVGhhbmtzLCBJIGhhdmUgbWFya2VkIHRoaXMgYW5kIHRo
ZSBmb2xsb3dpbmcgcGF0Y2ggYXMgZGVmZXJyZWQuClBsZWFzZSByZXBvc3Qgb3Igb3RoZXJ3aXNl
IHBpbmcgbWUgb25jZSB0aGUgZGVwZW5kZW5jaWVzIGFyZSBpbiBwbGFjZS4KLS0tClRvIHVuc3Vi
c2NyaWJlIGZyb20gdGhpcyBsaXN0OiBzZW5kIHRoZSBsaW5lICJ1bnN1YnNjcmliZSBkbWFlbmdp
bmUiIGluCnRoZSBib2R5IG9mIGEgbWVzc2FnZSB0byBtYWpvcmRvbW9Admdlci5rZXJuZWwub3Jn
Ck1vcmUgbWFqb3Jkb21vIGluZm8gYXQgIGh0dHA6Ly92Z2VyLmtlcm5lbC5vcmcvbWFqb3Jkb21v
LWluZm8uaHRtbAo=
