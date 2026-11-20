Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795202043;
	b=C9Ch2pW5ErBA8Ey94EjjtBpvA9g+0WiE9Kevtff8fXTL6fSeObdfXfW2Gol3It2Sm0X9
	 rKMUZnGytZI7w0UwJXXF/6hcLPCWh5sUcINoSTfkdlQ7DRR7Angqtts+9L1W44u//CvMX
	 0nAZ97Mdju84CKDGTU9CMuv2+H9Xrss3yf2I70MQNpG5BWREhoc4uxbdh/6RCdSA0zHa4
	 ioPEXt4V4k9mJIdsqLFjCmWsRuMUJ5VKiWUSeM3+fe16ArE6SXbMfknCZ9IRlAIrVrLqS
	 3d7ZU2WWDIajfLsY+RXTp1a/i6RA+M0WRCVkHEon2wQfNNDy0z1VKe+cc0u62rEZEDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202043;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=YjkX+SIhmCFu9w6Er5NTY8ZxVe8WqPbD/o8Zqp+diPw=;
	b=i6x47sr2D/Hk1FuxrBFIBxrJR85v6ioUIabB9zzepL1l+YVU7LvwqjCp3vTIA2qUmdfV
	 ImI/cGamfXtshlwGqYHIzP6Pmw3LwqlfDOYEMZXvy5eM2FSJqfgJa7CWgEMs+nTjeTTIP
	 /MO0GtWVDxQO0Jocm3Uz+63NRPCI2OmyCVm8APg8Z1ili3d/4yap6WVEi3FCUdaf5g/dm
	 oVmLhwB92nWdWYhQsAdhtHbbi7ibrLiszeyL2T8uM6MhozfMFyYunFfb2SZPLphb5CrCZ
	 Nxxya3dt3EzV5shyaiiZMUKDUks9laN9IvW/Aoy7Mjojv0LyBdcXVYjOjH/h4S/ia9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PgJRtcQR;
	arc=none smtp.remote-ip=209.85.210.52
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC53606A33C
	for <dmaengine@vger.kernel.org>; Fri, 20 Nov 2026 19:14:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CC53606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PgJRtcQR
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-8629fc8ad64so765993a34.1
        for <dmaengine@vger.kernel.org>; Fri, 20 Nov 2026 11:14:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795202041; x=1795806841; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YjkX+SIhmCFu9w6Er5NTY8ZxVe8WqPbD/o8Zqp+diPw=;
        b=PgJRtcQRkArNOOYJpsfqboxt48e5N/IDxRgf74ME4tSG/G2dNoNtOyV3dsWiOgxXgl
         PUSQlqPWYRdXCcQXJz8EUsX9RtaaOqoEBudK3L09fA0FOgQ0Nh4WdZGpaxzD1dpmddug
         wOn1QWh6l9e46fX+V0uIvBN8ApzRUV3fh6UbAmIJNYi2gca24lBu+hLmTaTBXYwebrNs
         ud8D7HO7SHDQ7f6kpkkADqjeFeVFijW+ZlZWvTOr2LH3BE2SlasKPsysTAp+axajtm0c
         Htw3ZJXpgIbtqRPEO/XR29AWqkFU/TvgEX9lvDDfGwoJ2MFJnDk6VkEj954GRS1w4PdR
         40Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202041; x=1795806841;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YjkX+SIhmCFu9w6Er5NTY8ZxVe8WqPbD/o8Zqp+diPw=;
        b=irp5zzjS92RUUsvbs0kqS0fHRrUN1Iwhq+7Lj9L868rYyiq9VrwFnFESBWKUkg8gBP
         0ilUEdBpEj9gG7AKeNyALgT9aLhsvcDtIcuPXsFWIZJEQ1Of3JtplefjHRjpd9SaYU4r
         u8kI8NzBLo39vU4dVcl6RpjIojOCy4diaobw3neyjWv5GR8fIQo0uG1Zfv2ekODUJeNC
         DgFgnwX4W0+KMigZn9opiba9TUu7a+zluTpngLliIO9L7nEvFW7wB8BL2Uknz/Ou1JOz
         lC/PMey0JDXhSbRnDmeClKWuBwve7az7HiSnAf3+JAYbUDSev7EKdZbWMORBL1cYRIw2
         eYGw==
X-Forwarded-Encrypted: i=1; AL+hErE91SZG5U8uNw+XALwnFNewUsHPj+lkvjb7Kia4zHf1W8wCguAb48gqU4akBWMKiI5/EZpnwbUiBh0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+KyyrBkEaOBGIAN5Z2nAHTJk6gfW3zLsJY2VRzGGrhBeRH2y3k
	hQmKkPFRF+oO7HbPpTTt0NaPhM6D+pkOCipYIGnI8y/a/1HC60TlK6nW
X-Gm-Gg: AYBFou1izbmMRAyKXsfHCuNxx2KyY2SVJAauEe6h41wCdXYL7lgfOgFcakKZDB90YIl
	OlcDEDMcyYrWg0ytiRVkOlxQfsweTJOqOEkUmKSCEZNmJY6r6d9NX+ZU6TP7E6352wa2uO8gfvy
	SsIlcdTnOhgztmOVcExd6ssY6dtKc/glHOVNZfslQuq4SVFNqu+jXzrDN8LPtVY/ledWtWwrrFb
	WZwKaprU8pKlBq4z/VnEI9wmtgeZvRlEh5Lh/Srd2oA5N3qcJJpLiBemTRwAg24GIlLpAZfOlkR
	P/bQvryB+ZMs/i6pDy+Xk1WHmjuypJfcGP9WpoMnsorjaXMgTDL91hTVkM3Ft/i98dJvO9Wuflh
	rOksC4BcKW5mUrKJvA49PeE3yvXeRHVul18DoESDwZXmBcqvmaAohoUWG45UuH3XYnhD7zYDeJR
	u8mMFq6mzdmuYFWwU1yhDbAEh4UpeqfL+TX7qnHU7VY4oQg/UIM6zt0mcvNDik+x32bmF6V8bY3
	yeoz2O1JK75gvCHSLvNYoWWt4yYDp8uZVp++231/RkIW+Z8+KkA+z6Td7X+8OAu8VWOm6c3hU1S
	KIh3RgSEU5mZal3MiN92WiC8Y+Vl42pTu0U/9s6XKCQ8nMbNTOs0jLe0sse3LaGd8//XnNbMW1w
	E53I7POSOTvefHYDN8D0T2BzNGLXiyNAIvPojHEsVMRvECohHie97RNCoGWVwwzx1QJw3MGBWiw
	/V3bjDmMdyZF2EJqmkmBd8a0DkkgYaC0cZXkZG4mL8AHQImb9oyA1/
X-Received: by 2002:a05:6830:4ac5:b0:81e:b506:592d with SMTP id 46e09a7af769-86315987fa5mr4981894a34.27.1795202040971;
        Fri, 20 Nov 2026 11:14:00 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168f3964sm2654782a34.14.2026.11.20.11.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:14:00 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 12:13:51 -0700
Subject: [PATCH v9 1/9] dmaengine: dw-axi-dmac: keep cyclic mode in the
 descriptor
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
Message-Id: <20261120-submit-dw-axi-dma-stop-pause-v1-v9-1-48ab58961d6e@gmail.com>
References: <20261120-submit-dw-axi-dma-stop-pause-v1-v9-0-48ab58961d6e@gmail.com>
In-Reply-To: <20261120-submit-dw-axi-dma-stop-pause-v1-v9-0-48ab58961d6e@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Sergey Khimich <serghox@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sia Jee Heng <jee.heng.sia@intel.com>, Baruch Siach <baruch@tkos.co.il>
Cc: Mitch Barnett <mitch@accuratesound.ca>, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.17-dev

dw_axi_dma_chan_prep_cyclic() sets chan->cyclic before allocating all the
hardware descriptors and leaves it set when preparation fails. The flag
also survives cyclic transfer errors and channel resource release. A
subsequent noncyclic transfer then takes the cyclic completion path,
leaving its cookie incomplete and its descriptor on the issued list.
Its zero period_len can also cause a division by zero.

Resetting the flag on failure or channel allocation is not sufficient:
preparing cyclic work while an ordinary transfer is active changes how
that transfer's completion interrupt is handled.

Store the mode in each descriptor and use the completed descriptor's
mode in the interrupt handler. Cyclic preparation sets only its own
descriptor's flag, while the zero-initialized noncyclic descriptors keep
it clear. Error recovery and channel reuse then use the next descriptor's
mode without relying on channel-wide cleanup.

Fixes: 1deb96c0fa58 ("dmaegine: dw-axi-dmac: Support device_prep_dma_cyclic()")
Closes: https://lore.kernel.org/r/sashiko-outbox-208213@kernel.org/
Cc: stable@vger.kernel.org
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 35 ++++++++++++--------------
 drivers/dma/dw-axi-dmac/dw-axi-dmac.h          |  2 +-
 2 files changed, 17 insertions(+), 20 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index 7520c78f55cc..6dae63024721 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -801,7 +801,7 @@ dw_axi_dma_chan_prep_cyclic(struct dma_chan *dchan, dma_addr_t dma_addr,
 
 	chan->direction = direction;
 	desc->chan = chan;
-	chan->cyclic = true;
+	desc->cyclic = true;
 	desc->length = 0;
 	desc->period_len = period_len;
 
@@ -1117,25 +1117,23 @@ static void axi_chan_block_xfer_complete(struct axi_dma_chan *chan)
 		goto out;
 	}
 
-	if (chan->cyclic) {
-		desc = vd_to_axi_desc(vd);
-		if (desc) {
-			llp = lo_hi_readq(chan->chan_regs + CH_LLP);
-			for (i = 0; i < count; i++) {
-				hw_desc = &desc->hw_desc[i];
-				if (hw_desc->llp == llp) {
-					axi_chan_irq_clear(chan, hw_desc->lli->status_lo);
-					hw_desc->lli->ctl_hi |= cpu_to_le32(CH_CTL_H_LLI_VALID);
-					desc->completed_blocks = i;
-
-					if (((hw_desc->len * (i + 1)) % desc->period_len) == 0)
-						vchan_cyclic_callback(vd);
-					break;
-				}
+	desc = vd_to_axi_desc(vd);
+	if (desc->cyclic) {
+		llp = lo_hi_readq(chan->chan_regs + CH_LLP);
+		for (i = 0; i < count; i++) {
+			hw_desc = &desc->hw_desc[i];
+			if (hw_desc->llp == llp) {
+				axi_chan_irq_clear(chan, hw_desc->lli->status_lo);
+				hw_desc->lli->ctl_hi |= cpu_to_le32(CH_CTL_H_LLI_VALID);
+				desc->completed_blocks = i;
+
+				if (((hw_desc->len * (i + 1)) % desc->period_len) == 0)
+					vchan_cyclic_callback(vd);
+				break;
 			}
-
-			axi_chan_enable(chan);
 		}
+
+		axi_chan_enable(chan);
 	} else {
 		/* Remove the completed descriptor from issued list before completing */
 		list_del(&vd->node);
@@ -1204,7 +1202,6 @@ static int dma_chan_terminate_all(struct dma_chan *dchan)
 
 	vchan_get_all_descriptors(&chan->vc, &head);
 
-	chan->cyclic = false;
 	spin_unlock_irqrestore(&chan->vc.lock, flags);
 
 	vchan_dma_desc_free_list(&chan->vc, &head);
diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac.h b/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
index d8dd07efe60f..3c86e5d468ea 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
@@ -50,7 +50,6 @@ struct axi_dma_chan {
 	struct axi_dma_desc		*desc;
 	struct dma_slave_config		config;
 	enum dma_transfer_direction	direction;
-	bool				cyclic;
 	/* these other elements are all protected by vc.lock */
 	bool				is_paused;
 };
@@ -105,6 +104,7 @@ struct axi_dma_desc {
 	u32				length;
 	u32				period_len;
 	u32				nr_hw_descs;
+	bool				cyclic;
 };
 
 struct axi_dma_chan_config {

-- 
2.53.0

