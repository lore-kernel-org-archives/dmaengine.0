Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.72.192.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795183994;
	b=YK3/3uK4q4OaHSqaEURf2oU1fZvnoIFwKn6vUkiMwBd2r8XjOP0KoWgNDGCDtlBkjNt2
	 3UP7+5PR/tDePGUmdZ/Tk5FhxxF5uaElthw7MaGT7bCb5B7mL3Fvsj8cYvUAmicQQFlr9
	 U73GSxinMbtuATaokx8RklyzKzoywefZefMwjccn8g9NIUCs7Hr7QSNCZm7AKPlZmPXdN
	 XMzpG2ns+jjZAIjPTEqcoJPS+yseQ0MfC2beuWSRs3235noz0dEzoGfUSZGjWPENc4Bnt
	 tckoewliKor3UzF34Lp4ozryTslnZorCKS9WBaBWmHwYFodKNV/raQ4KgQYKce9Nqeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795183994;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 Content-Language:From:Subject:Cc:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=rOzo8eaHNTzgKwNpz3RZkM8Nd/AJFrwX2UIXdMg4T3A=;
	b=2piyT3ZjCbmPGpVcYKuCTu9mN3nqiBfTE9Atb/Qcoqth0Yhyh9E2zyIxfywyQqYVUULw
	 j7VaDq0ueLJ+bZW4Xkj+W2hCBp8mylO/NlPUnP8qTH+cXKBOAhONu2drPyN5fz+Knyp70
	 zE3vsAkq1hOIwfoQfs5RwmbOXrZ6+Coi/tcFweGqo1wNEzrxVoqtpRk/xbrhh7PIQgNq7
	 39rKsoioQBQDI+QNIUBDZ69d/z/7ffKKEDeq9vzlrQf5N3R2leZH0KcKpr4cEXcpl0gpp
	 KoN/g8IGKLV5EEqtdgMiLGJr37fKeAkTQ+S6FCsTO4sI41QJ7KzvaE+DYbM399MKppw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=web.de;
	spf=pass smtp.mailfrom=web.de;
	dkim=pass header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=PvPLiBu0;
	arc=none smtp.remote-ip=217.72.192.78
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C6E606A334
	for <dmaengine@vger.kernel.org>; Fri, 20 Nov 2026 14:13:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4C6E606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=PvPLiBu0
DKIM2-Signature:  i=1; m=1; t=1795183991;
 mf=PE1hcmt1cy5FbGZyaW5nQHdlYi5kZT4=;
 rt=PGRtYWVuZ2luZUB2Z2VyLmtlcm5lbC5vcmc+;
 d=web.de;
 s=s29768273:rsa-sha256:VGzONXSAt8qCaQlY25+lXsxKUpWz
   pciGpXirJUeJbFRRN9YdUIHr0a4s9oo3Q7ZbC++jq59fdxEeWmBdLucDCf6OxwM3PMBYMBtQ+Cy
   BY8Aa9i+nRdFBJIqIbJdYDIOuo9ZY7JoTjFYSlxssKtqpl6IR+9U9lE2gZW5w1VXAArwhfY68Kn
   PE2OWbPwDlc+YoQRGzjCHU0p3gaNtucKio2j9sXMh2jXGSY4y+Bj3/1989Z7J/IpYH7bGcbAvRh
   AYEaPEvIaaAHnOT+DpfanZ0KHoyAZVaiP+CI33U0HCgsxFTbphvbJ45Mxw+BpJa9+EifAuJYRHK
   h/erMT3DOg3fTQ==;
Message-Instance:  m=1;
 h=sha256:
   xIolf5DpOZ37sIaNn2iGmrS67rrI6EmsojgkUXtmzIc=:
   N20fCpoVwftT84kLJdRKHHSRJrcKobPW/NSB2CPrnIY=,
  sha512:
   C0D2StlsLimCSvgAwXUiV0U26VNZmeDM0VaeTnoXZY5ZjohJZgCSSOwaJug4+DYzN0EDTy6tg8GMhkuTPYhwgg==:
   n7qjq2CFS/fUK0x8T61hUU6fdUFG0sBiJO+RelNKauGycHxll75eeTZ2Nc8iMsGCNCPGvEbdGH6kR41LRDKIMQ==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1795183984; x=1795788784; i=markus.elfring@web.de;
	bh=rOzo8eaHNTzgKwNpz3RZkM8Nd/AJFrwX2UIXdMg4T3A=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:From:Subject:
	 Cc:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=PvPLiBu0OYWJuqZiujdiBqGLCeSTHIgptqnibQOz+f/Bh5rhNEfwJve6tzQETwJR
	 Q7rKcsmH6RwI7VuaDW4rALqT4ZkMqFlkUyaP/l0lUpFOFnyZ7dd8IdDKm9vTdYTFN
	 eJMu8JSsiedhf+FX/nBISJIzGlz1cZQY5rkzmUZz+A2YfxBcSSG13+Mu1Adq0xm4x
	 A7pgH8WT0fdQN33sRLjEe6r5lCvNkn44yrocbkE5d9S4Nnc/cSB7YXQbX/HBU6HjL
	 vnz1CKZ/TkR9PZLrOFCWCfSX4WnzZnk1YziI007W3Og8A/8ce67VLrbYGftgqVfYu
	 OQBwPkZugyi3fZQAvg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M76XN-1xcv8x2u1H-0089Rz; Fri, 20
 Nov 2026 15:13:04 +0100
Message-ID: <4267a49d-89b0-4564-b22b-995de017f52b@web.de>
Date: Fri, 20 Nov 2026 15:13:01 +0100
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: dmaengine@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Frank Li <Frank.Li@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Viresh Kumar <vireshk@kernel.org>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH v2] dmaengine: dw: Use devm_clk_get_optional_enabled() in
 dw_probe()
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ho7sC3wwywciBtO23pnEnoH+4RzaieyPlSlS8fX5s7sFIEGMiJC
 OXvLR4Fl/JdsmW5clHyezccLJ3RN9p3X9if+Iitwa4XrKyeVp7o6/N/fEKPeV8UJCDH1T8b
 gF8Eyo4PD52fzxYtykDMf+ASbLOlL6Mxrezs6potjr9asF0ZviiAu28zzfRf2iYUaW8I8vk
 rIjx2rvCzGLyEGLbzqj2Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:EC5v2chjmes=;Fd9SgR3oTI9T2Ty70foPQCymKs3
 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

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 20 Nov 2026 14:23:13 +0100

* Reuse existing functionality from devm_clk_get_optional_enabled()
  instead of keeping duplicate source code.

* Omit a clk_disable_unprepare() call on an error handling path
  and in the implementation of the function =E2=80=9Cdw_remove=E2=80=9D.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--

V2:
Andy Shevchenko and Frank Li requested further adjustments according to
the proposed changes.


 drivers/dma/dw/platform.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/dma/dw/platform.c b/drivers/dma/dw/platform.c
index 7e76391475ac..13c44ee5e047 100644
=2D-- a/drivers/dma/dw/platform.c
+++ b/drivers/dma/dw/platform.c
@@ -64,12 +64,9 @@ static int dw_probe(struct platform_device *pdev)
=20
 	data->chip =3D chip;
=20
-	chip->clk =3D devm_clk_get_optional(chip->dev, "hclk");
+	chip->clk =3D devm_clk_get_optional_enabled(chip->dev, "hclk");
 	if (IS_ERR(chip->clk))
 		return PTR_ERR(chip->clk);
-	ret =3D clk_prepare_enable(chip->clk);
-	if (ret)
-		return ret;
=20
 	pm_runtime_enable(&pdev->dev);
=20
@@ -87,7 +84,6 @@ static int dw_probe(struct platform_device *pdev)
=20
 err_dw_dma_probe:
 	pm_runtime_disable(&pdev->dev);
-	clk_disable_unprepare(chip->clk);
 	return ret;
 }
=20
@@ -106,7 +102,6 @@ static void dw_remove(struct platform_device *pdev)
 		dev_warn(chip->dev, "can't remove device properly: %d\n", ret);
=20
 	pm_runtime_disable(&pdev->dev);
-	clk_disable_unprepare(chip->clk);
 }
=20
 static void dw_shutdown(struct platform_device *pdev)
=2D-=20
2.56.1

