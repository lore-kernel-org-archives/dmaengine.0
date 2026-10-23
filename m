Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792725301;
	b=G7TS//nSatuB2pv8i/pVIms8uvnuMjtp3WgmxvYg5ZCYZf3UrEvIELTbgVgzlVxHhNCn
	 nigtrXHk1JhpXKs6vLiW5OShN83HExy4HHnoHRI0as2lT7bLuP3HQgT7eWK1K1D1cwPbV
	 g2Jn6Nv9MWCTG0CT/kHTDci1y+5LGsBwpUw4hsXYzze1E8+kAIg7HayznUZ65a82tshIV
	 mZkI3Gq96kdUaHJp/yT7BOGw34irzYdbacwHcCzmRGg9po/BZziLMXntTALtE9+HFh/29
	 TnfN3WI04umQyw5cJF5US+PR4ZdA2TaKc7jIlkp0ow9XIIekQxCs+SkHGynSJl6oQtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792725301;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=M4PRNLWENu8KTspo6tzX21p33JWmvMwO8+MOa0PXQoA=;
	b=e20T68zJyISS42hi/eaBGkbG1FM+zHV6KBkaPiZqJU/p1ldXVfkeIKVrta9nLrVtbOhh
	 +u/58DAfppEBbIl8Tewq5teBhb2qh0x++crOeJ2sqJQV3o4O9+WRN28BfMseM0VbiEvW1
	 8ppMdwAjVY7+UV08A1E2CmymwdMrKIBiKf882viHaZfsqjFY3Y5RsI9ChM3jlAiwGJUVY
	 jTyXiBPTuDwxBQ+x8jen2On+6MtK1oZHp8uirnRfy6oQv4vNhfOOJ2ZKQX94c3EhDDWI1
	 UML4kCCPtbybk7umvpswYFAzV/njiDZTdJHHc1TYVC0u/WTtcv9wMTvlTVpD7txudVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JUBWWbQj;
	arc=none smtp.remote-ip=209.85.210.45
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D37606A32A
	for <dmaengine@vger.kernel.org>; Fri, 23 Oct 2026 03:15:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71D37606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JUBWWbQj
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-823b938464fso293615a34.2
        for <dmaengine@vger.kernel.org>; Thu, 22 Oct 2026 20:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792725300; x=1793330100; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M4PRNLWENu8KTspo6tzX21p33JWmvMwO8+MOa0PXQoA=;
        b=JUBWWbQjOD6+zb3S2QntWMG9Wgx65Ryuf8ExFxdR0rr+GWINn/VLk38OnXlf2DHiXD
         F30L0dasS7cG4nIaEAZTznpdlRNIvaqDjwVhVEKLOaxyTLhn19Dr0/B5ISEIC2TNuXPw
         WSUprtTTkPwm+QNgZ4ea91vBgdKY2TIjvw+w4Q9mrl22UctVk7C7dId1O9AluFxk1+Da
         FlUOcjJFbnGBAYJV6p4bVHpg9kU9II6CMx+AnDusSXwF/ysmepiexZVy5jN1iv0BWFT/
         T/rlTnydrjNEv4pZc3bd1y14QH1gcU2TUtHIxIz9RoeXgxGY9qH/n27LkglYnywVkhCV
         LCkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792725300; x=1793330100;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M4PRNLWENu8KTspo6tzX21p33JWmvMwO8+MOa0PXQoA=;
        b=WGn5jx1UY2Gwxl/h+zxiV+vAQuQt6mfQ5BpsycLwpIifPz2HDXql5EzglYRRtjLHip
         yMxQZDJmPjdxFghsEeiiOSEFBl/hA74AqwXQP3uUNDrddZvcHahCa/D9sStzTi0QNPH1
         WH0jm27xucrJshqoTf+NzCjH1k2VfnSDPTksGO09Ku+lAskEr4YnsckHZhJ7JZF3sse6
         gBsq/FNMfPYheHCdVtYzZq94lpoYdE8ok8sRSKLNNyaxcXoXz2IecCP2lD0mL147X7ve
         TZNrumIddCaUGnDba+wFB8uQ3PcSeHawLVHHw+XIcf5Y3qUuiqoSNdmBG9/U0R8/mgiS
         nqHA==
X-Forwarded-Encrypted: i=1; AKwUvBzBLqbEK+GPn8dhMLGn3rxIFpemirCm4X1CN8JQaIh8CqNytkPrKM7NwqXUTVRLmOiblqnvbUHX01c=@vger.kernel.org
X-Gm-Message-State: AFq9FYLRlShtaG2z9b1K2NLiBj1EA/luibySGU6rQXDozfv1b/GumnYu
	/KRZPEJ4VUlb22asG4m08uWDKd7PvS31PlyQ0KoMatoQ/CbGVgX1sfTS
X-Gm-Gg: AYBFou17U1pCqlpKTht0CZ+zwdLpCxegPfcrP4GMLOhxXxGZ1Cb6Mc1YLgtsxZqQ464
	LIEygX2Lzcf72g/PoKnxMeX9ERL+P1cwyQ52cGQuNN8dDcllvEQCIV9s0xiV3iw1vXgbcZIDEHq
	6QCNXq8tIhOmEO86Ce7D8GLY4PSiETo+y/EuuE+BwLGnjpabq+OplTUdQTBhThfYVOa5+9LTf+8
	QxaAzNScJh0A5TQeqpenLwX1rVcB+AFljEnLpZlVD6G9oxdy2QmLqJmOqTX5pNPGo3UVA641Nor
	gXEyQDAlY9ITrztAIhCdHi9k/MBJUtAr4ZlyH037IwfqYFzbscIe7B1A/DbYn2ogi1fwc64hH+n
	o8xqhbHIftdb/4eq81FA58DWQOQyMhKMcIFWjCqrqu1lrhwRctCWaCdxB++R7Ak7vrZmMzgxJ7U
	ilDum/lXoI2kknyUZN8z1AXvjj/sqLETysdizAzODeaf4HPMwPhokzub5nrzROvKDYnX1CohBtR
	lagX5rhHtiLpiWAEWDr8A4dAjY5UQ+GskDxtgDPngb5vg4XwoJUeMwE/mxL43hyNz7HS/+2Gg/o
	HTIxtB/649SaHHZJr1qIX0nzKwr6JM/jHHrmUFBCO/lOUxShT6c1UqtTBV1t2u4iSs3jd1LmH+0
	+b13QRNae0kE3O2QLDX28RDxbNcajLNROJu7N6IlgE5z3sbIyqz3ENamiJbNetnJunRC6bwfqqx
	rhIp4Q3cHQowqg9rXrrbAWmn3U
X-Received: by 2002:a05:6830:34a2:b0:806:9a8d:4b9b with SMTP id 46e09a7af769-84faf57f015mr783469a34.15.1792725300342;
        Thu, 22 Oct 2026 20:15:00 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-84fbda584d9sm938638a34.13.2026.10.22.20.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 20:14:59 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 22 Oct 2026 21:14:53 -0600
Subject: [PATCH 2/6] dmaengine: sun6i: handle the last partial interrupt
 bank
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
Message-Id: <20261022-submit-sun6i-dma-lifetime-next-v1-v1-2-01085f684c9f@gmail.com>
References: <20261022-submit-sun6i-dma-lifetime-next-v1-v1-0-01085f684c9f@gmail.com>
In-Reply-To: <20261022-submit-sun6i-dma-lifetime-next-v1-v1-0-01085f684c9f@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Arnd Bergmann <arnd@arndb.de>, 
 Maxime Ripard <mripard@kernel.org>, Jens Kuske <jenskuske@gmail.com>, 
 Jean-Francois Moine <moinejf@free.fr>
Cc: Hongling Zeng <zenghongling@kylinos.cn>, 
 Chengfeng Ye <cyeaa@connect.ust.hk>, 
 Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>, 
 dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2

The number of physical channels need not be a multiple of the number
covered by an interrupt-status register. H3 has twelve channels and
eight channels per bank. Rounding down the number of banks leaves its
channels 8 through 11 without completion handling.

Round up the number of banks to visit, and stop processing the last bank
at num_pchans so unused status bits cannot index past the physical-channel
array. Use the controller's configured bank size for both limits and
the physical-channel index.

Fixes: f008db8c00c1 ("dmaengine: sun6i: Add support for Allwinner H3 (sun8i) variant")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/20260706065650.34B131F00A3A@smtp.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun6i-dma.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 9d94a37fcf10..0a9645171180 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -587,12 +587,13 @@ static void sun6i_dma_tasklet(struct tasklet_struct *t)
 static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 {
 	struct sun6i_dma_dev *sdev = dev_id;
+	u32 channels_per_reg = sdev->cfg->num_channels_per_reg;
 	struct sun6i_vchan *vchan;
 	struct sun6i_pchan *pchan;
 	int i, j, ret = IRQ_NONE;
 	u32 status;
 
-	for (i = 0; i < sdev->num_pchans / sdev->cfg->num_channels_per_reg; i++) {
+	for (i = 0; i < DIV_ROUND_UP(sdev->num_pchans, channels_per_reg); i++) {
 		status = sun6i_read_irq_stat(sdev, i);
 		if (!status)
 			continue;
@@ -602,8 +603,9 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 
 		sun6i_write_irq_stat(sdev, i, status);
 
-		for (j = 0; (j < sdev->cfg->num_channels_per_reg) && status; j++) {
-			pchan = sdev->pchans + i * sdev->cfg->num_channels_per_reg + j;
+		for (j = 0; j < channels_per_reg &&
+		     i * channels_per_reg + j < sdev->num_pchans && status; j++) {
+			pchan = sdev->pchans + i * channels_per_reg + j;
 			vchan = pchan->vchan;
 			if (vchan && (status & vchan->irq_type)) {
 				if (vchan->cyclic) {

-- 
2.53.0

