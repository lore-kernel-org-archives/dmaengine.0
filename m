Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794727187;
	b=ux+SNtuE9LpWW9HRCz+jILZDkFA0Uv4t25zWmZlRXMQvN3GsfUZw08b2V8kyN6DyaY90
	 6kKiu5rZAqMADZ5aGCKTo93JgHfQ8tIaEnwI9E9kLI5YNxBn5h+ECqNSFME3kqKHIS4wb
	 KaHn4rbLhJ53KSmTKHPIrDwTp/IPeWohViSLUITL0tk2ZRludj6SI2JbSVi2xockNuDeC
	 azT0wjfpFFoUW7aZnjUk4bKqpaQm1oayYTATngKKyMa/6g656LvjxYrY/x78YNvG37NWv
	 IIKWhHTwqQ4+zylcOoJarsR62fPPtfzfMynAmHkYh8/h+grwrjrVUzlg5HdTXUYiaoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794727187;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=zAy+2tfRvtTehCJ0q+J+a30RAb0TsAI0p7oefFRsmAo=;
	b=QW6cUViZ4ICmAwKwr+8HFVjENDXJ9WTgL6CATqHumBpjFZ8ducwxEG/1CviD6SFwirqX
	 6QRYjf1EdKUDX4FdxeLR4gz93gxySeBGdtBPBpeof/EKdMbUyt8rliEjJ5jYp9G1ysmp3
	 VRy84eNWcsMl79AuPbc9okWzyQKhgdeO61YmUgeGX0UMX4Xk93wdrUglCeH4bOEy6xAaP
	 Yig897eG1HxFffh8BoytqHnJtB+olEvhp3NX5g5QEunIybAFNS5VoXih45jPjTkPq764u
	 TQCJ2VvtNHpEvdhs5yzaBRi/yEt1q64CxcCl6wHntYFxXruyKJtgarB1eBk4mmD9QmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zRpjmk3n;
	arc=none smtp.remote-ip=209.85.161.41
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C75606A8AD
	for <dmaengine@vger.kernel.org>; Sun, 15 Nov 2026 07:19:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70C75606A8AD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zRpjmk3n
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-71ab5e64742so2257743eaf.3
        for <dmaengine@vger.kernel.org>; Sat, 14 Nov 2026 23:19:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794727185; x=1795331985; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zAy+2tfRvtTehCJ0q+J+a30RAb0TsAI0p7oefFRsmAo=;
        b=zRpjmk3nu6KU3OeTu9Y/9TNQULkJywoEkcO/jCfYyezVOF/MwUFS3CY8EsOdj1uE13
         co9br8t/leLffNqDJmvzTBe9yRnr8QF1il36Wo1IgSlZJNVOdbaC11e5BJEUwMenWtMq
         KJNwRg2K4jqBInXVCZQcu4oV2zvJ4axzj+8cTvrpPxuzdNE6R4OUpNyK6LNbnmFhAKUt
         Vi8kU5ur2Kve8T+D/mxSLx3FvdoyseeRjBJEPhye8T/1nSmgAEpfINhp862EW4DTvjZZ
         mYdQ7b0/TT43XOtCbphAZw0JKlPBwy/G0muvcMUAAdma57NLM7YKl03Ar96nh9r6bizU
         deqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794727185; x=1795331985;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zAy+2tfRvtTehCJ0q+J+a30RAb0TsAI0p7oefFRsmAo=;
        b=TDJEKzchWew9/rHThjeNMhi/mWn5ZYLILlerOcl49fgMYF4NIP/gXZt2cHhWzV6eHl
         L6+VbZsF9KApDRWpmCINbgN/1MuxtnRH3l4bJ9QlEc1E7M0Oe2prh4wKR8huXrfOJLQJ
         zVx9XRECaXvp9RO6NU8nbmDvhLcGxmyIBJgytAPyGxmz19fIgQBJ4fsGooiYV4iqoE7f
         vHVX+49SCL+HBBNN17eRHd4DWfBlaQhoBfp78wOe6CD6S7buJb4UhJ96Li2NysnuZaTi
         YO8uSVwqBNPySp087sxLJIFyE1n4sKxnbPu6Td/f7NNH+MPXCIhKZwS/ArxGanASttUr
         Z1mQ==
X-Forwarded-Encrypted: i=1; AL+hErGE/xgoGSHdKPiKciyp8XQhigaWH1imkyNwlCdc4SkAEdYwh9fY1GS6AIMPj8AdTRXXxMk7uone9QY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9cwtvmuKrlkZ5c3OylI1bVXdF2788/uPBcsiOZqPMkfwEzwoOA
	+RyeUVPlBSZOQgygBBguGVafiEaCYfzoBB9RTN9fJ9+paXL+kLamRlnd
X-Gm-Gg: AYBFou3oFfC2Lu+nwJQZwRPRjQ5yf4MSXX04uCOKC50hSFeplvLwyA64pr5gW1B1hzs
	+4E/mhzTOih/9zW3+5upnnIRAiuBqv1yaub40NGdcy2bgapO//dhlJXBpS1tZVRwS8FpI5g0VBb
	H/0Y9EGKPrHHSxXLy9xv/6IgOeDQMxd6W1ZTuS1EunlAvS27VYVpxmnXl3QHhPQOS9vOXneEthA
	Imc6W5CkYXja2TXjwO8YYdFS3yc/lyOP0d+r9kCk237CPFZ979yWmijzJOHIzoynPdYomZNACnI
	r/purnnP/K0xW15KgKQ+pBqqiii11RESQlbw5tSbj343ZXAR6Q83lzMs+3v0gfdnJ7hP50sPo6i
	ne9CNEquLSvym0PWcyxyU3vB1LStZj6Uf/yIaJcwhm9WM34n54LvQx0KVcknTlDvMvagd5213OE
	fsSOnTMacIbpiskp9lCIQimoUnxDbH4+CPgvxkckXathHaRg6IJqKpIdgy2i25/KQgJDAxR7p2x
	1RZLMA8VT+Kx+LtSUwE1C+65ULI+kr2AeRR1lOe/EMS05YCswPQ1De4WqHzGuCGuhGaGokG1pne
	IqmHiz6suEx309S6YCvJxrMg99X/cu71HAvSRP/KRA2eXMJ/KGLAMdI10W0cUPdfAXYClVOWQxE
	kdqKgmYbCjV5aqnp4HlVW5tkdQm060cZS7SxEFtTBLarQkgjh1KyrMm4Oz3OPWNw9Ualo3n59Ql
	f3O+tQb1ivwGzgZC7tkmbeUxqCUFLST1p5NSUxGrnNBy7ozKO/EGM=
X-Received: by 2002:a05:6820:c0d9:20b0:71a:e7c1:d1bb with SMTP id 006d021491bc7-71ae7c1dd38mr505443eaf.71.1794727185421;
        Sat, 14 Nov 2026 23:19:45 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ae860ebd7sm1145321eaf.8.2026.11.14.23.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:19:44 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 00:19:37 -0700
Subject: [PATCH v7 04/10] dmaengine: dw: extract hardware-LLP residue
 calculation
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261115-submit-dw-dma-synchronize-v1-v7-4-8d58f3d49e4d@gmail.com>
References: <20261115-submit-dw-dma-synchronize-v1-v7-0-8d58f3d49e4d@gmail.com>
In-Reply-To: <20261115-submit-dw-dma-synchronize-v1-v7-0-8d58f3d49e4d@gmail.com>
To: Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Dan Williams <djbw@kernel.org>
Cc: Serge Semin <fancer.lancer@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 dmaengine@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 James Hilliard <james.hilliard1@gmail.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2

From: Serge Semin <fancer.lancer@gmail.com>

Move the hardware-LLP residue calculation into
dwc_get_hard_llp_desc_residue() so it can be reused independently of
completion handling.

Keep the scanner's LLP snapshot, descriptor updates and early returns
unchanged. The helper reports whether it found the current descriptor,
including when that descriptor has zero residue, rather than using the
residue value as a completion indication.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
[james: extract the calculation without changing scanner behavior]
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw/core.c | 58 +++++++++++++++++++++++++++++----------------------
 1 file changed, 33 insertions(+), 25 deletions(-)

diff --git a/drivers/dma/dw/core.c b/drivers/dma/dw/core.c
index 2d69fab06601..5a1caca7ad68 100644
--- a/drivers/dma/dw/core.c
+++ b/drivers/dma/dw/core.c
@@ -267,6 +267,38 @@ static inline u32 dwc_get_sent(struct dw_dma_chan *dwc)
 	return dw->block2bytes(dwc, ctlhi, ctllo >> 4 & 7);
 }
 
+static bool dwc_get_hard_llp_desc_residue(struct dw_dma_chan *dwc,
+				       struct dw_desc *desc, dma_addr_t llp)
+{
+	struct dw_desc *child;
+
+	/* Initial residue value */
+	desc->residue = desc->total_len;
+
+	/* Check first descriptors addr */
+	if (desc->txd.phys == DWC_LLP_LOC(llp))
+		return true;
+
+	/* Check first descriptors llp */
+	if (lli_read(desc, llp) == llp) {
+		/* This one is currently in progress */
+		desc->residue -= dwc_get_sent(dwc);
+		return true;
+	}
+
+	desc->residue -= desc->len;
+	list_for_each_entry(child, &desc->tx_list, desc_node) {
+		if (lli_read(child, llp) == llp) {
+			/* Currently in progress */
+			desc->residue -= dwc_get_sent(dwc);
+			return true;
+		}
+		desc->residue -= child->len;
+	}
+
+	return false;
+}
+
 static void dwc_scan_descriptors(struct dw_dma *dw, struct dw_dma_chan *dwc)
 {
 	dma_addr_t llp;
@@ -354,34 +386,10 @@ static void dwc_scan_descriptors(struct dw_dma *dw, struct dw_dma_chan *dwc)
 	dev_vdbg(dmaengine_chan_dev(&dwc->chan), "%s: llp=%pad\n", __func__, &llp);
 
 	list_for_each_entry_safe(desc, _desc, &dwc->active_list, desc_node) {
-		/* Initial residue value */
-		desc->residue = desc->total_len;
-
-		/* Check first descriptors addr */
-		if (desc->txd.phys == DWC_LLP_LOC(llp)) {
-			spin_unlock_irqrestore(&dwc->lock, flags);
-			return;
-		}
-
-		/* Check first descriptors llp */
-		if (lli_read(desc, llp) == llp) {
-			/* This one is currently in progress */
-			desc->residue -= dwc_get_sent(dwc);
+		if (dwc_get_hard_llp_desc_residue(dwc, desc, llp)) {
 			spin_unlock_irqrestore(&dwc->lock, flags);
 			return;
 		}
-
-		desc->residue -= desc->len;
-		list_for_each_entry(child, &desc->tx_list, desc_node) {
-			if (lli_read(child, llp) == llp) {
-				/* Currently in progress */
-				desc->residue -= dwc_get_sent(dwc);
-				spin_unlock_irqrestore(&dwc->lock, flags);
-				return;
-			}
-			desc->residue -= child->len;
-		}
-
 	}
 
 	/* Residue describes source reads; only RAW.XFER completes a transfer. */

-- 
2.53.0

