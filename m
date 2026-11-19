Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795104109;
	b=MxprzWrgoHyDDiyOAcWvr3BFlHGGMaZHnut3i/wJZ8jxJh1uCS3BRmK9SsrNY3Ywc4OK
	 QF42HKG7cHtsh+I7Sz55DrQZHVHAToscMp7tINHUx3jLe8hKcDKbnIc3XjUA0pnywi/Ju
	 xnVL6xqRmlzbMJr3HghZFUTH7wIjp2Fc9uHAn/c9HrW17EFNSVLVY9PVPGOra3jz7a5nw
	 ISNnjJMApkwYThMuu4/NXbX09U6w8Cq67titEneQ0NajBXnfJN6kYbTvHRL6vwp+SnoET
	 EeVKTy15KHeHYiopc7EFipYLBpNmO85ubxCAk3nKJOEn8LEwc/GfTecwwOX+vYztEOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795104109;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=YjkX+SIhmCFu9w6Er5NTY8ZxVe8WqPbD/o8Zqp+diPw=;
	b=OKArExqIr2+X9VoeGBw52tA3PaB+poi1n9+nU2cxTnJxEtqShJ17rEUekqoCUq3OzZt6
	 R4YeWaDvJBd37dCrsZobVlR8ymlvPcKqdyzmupGRc+/Ll1ZvmrWtrGH4cTpkm9PLJsNLt
	 vMeJF3OPKlNASSe8P0gDRlREU3hvJ8Y5zmcYaM0jQBZthX8i+bZZ/YRZ8ZmhpjWAvhPiv
	 KD33EX3ntJzO4i8SDLu7YuqR5nQTUrN4ks+Ps4MwyvaCySZz7SOD5InuEP9WObaT8x8FU
	 a3qVn73zNFVAKVXjmh0foXZlVXTgNC6XHlgGmcHLoZlvXFnvhvz9wQPws5NcrjF3EtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gsF6tYcY;
	arc=none smtp.remote-ip=209.85.128.181
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A90606A32F
	for <dmaengine@vger.kernel.org>; Thu, 19 Nov 2026 16:01:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4A90606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gsF6tYcY
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8b335eeb340so21734617b3.0
        for <dmaengine@vger.kernel.org>; Thu, 19 Nov 2026 08:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795104108; x=1795708908; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YjkX+SIhmCFu9w6Er5NTY8ZxVe8WqPbD/o8Zqp+diPw=;
        b=gsF6tYcYJ8FC3cel931aNMGVn5nCBhw8tRjL8x+3fFjZEU2LMzexo+lcuHehFyBpfk
         suq7g2olxPfa0mZWy5fNnqXsQzLqdOwK6HtIaDW8tjK6jUbszUBul8YFd5T/gtVurhd/
         9GyaWFHTFsU4RE4Q0YUa9ll2eyoh3NHel7ynrhJZ6VOLWDATgM0l6YZK48ZLvZ+EURvH
         rIk5UvJwM75ceh8djNUXar/9weE7ol6em6D+tdeH0HD4wuSysrjL3L5NILFhYDc5DmD/
         nf1ZE7cjZSos43rc58Q8Zk8UZI3cv6FoRmdY3Fva29SR/tC0VDNgfzq14EMEMYnWzEa8
         HrVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795104108; x=1795708908;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YjkX+SIhmCFu9w6Er5NTY8ZxVe8WqPbD/o8Zqp+diPw=;
        b=FtuIaghiOn/ga6/3LhkB4xso86PA0CceNpW538N7I6367AXE05Q/VE4kr9SYLrGGq2
         4oVOs9pAom1hVtBfTCnqPZrwEm3ABmFFxSRdfiAy8pDEdELve1NOLajux7ROxwaTExjw
         mZqPOoG9h8SxDMF6TsweZlB/ziNoEsNK78WcSQ/ZzTO2JYlEFawWOVhAEN05kWKRPU6X
         r2WDwOnofZp1d7m1PNFOuwZlIHB1ZZkpE3f+vmWhg2off8QQ5Sdt6LMnOm5lgZ9uMXkO
         daBz4/45h4TN+eT3PaF2/VTsRPKd+6Quo8aAL5K4zIqEtzFK3HO+uuerXnvDevFccdqQ
         xWYg==
X-Forwarded-Encrypted: i=1; AL+hErGRhmppn+Rd/V7OEy1HYSAmvpovvTbZIRm7nE7wsaDEfn3Tvw5sxnlDYRTo0BmwmSShzEGr3aWMy5o=@vger.kernel.org
X-Gm-Message-State: APuU4Z8V1z+yXIEGIJCz59t/wdTcrjN+BZ0PnVDu5Wttiqwdycy+FvP9
	mLrNrB4OiE9X+8OjTha/uKEZhRdth4Dhmp412Mcn91oNHicTxujBurCo
X-Gm-Gg: AZFdTZci4phtxOh3HIbcLvsqaPOOy+8tKyazCSQwN0n6khtyAklD8E/VllhBWp8qK/G
	0zvSh0Z/wKABjKzKQTj9grlkSlRzv0EZSRjkvqzDw2JHB2ajMxqmUbqrW8rQRDfScxu5WFjA1Lf
	ChJsOr7TbVz+ubss8ZGIT1g06wtyc8d6b2IIbW3AFzHqXVg+pDDaXztHrCBYk+2he3KiHdfbSXg
	77/CeOgimaKb9SSHX2F/f6E48oHyNjDzdI72xBEU1gfO2UxpfD9WF0zZwGa0spe0sjcvoMSGO4J
	5VyyJpfRjL53ic+FD11mqCk6hDNWb3d04hThjHerqoGz4tMFqnkRA2OvzctFk6Frq9zaEyVeDpU
	f+5EeSeKrBHTSmoV+GFvEkJ7iI35823Mk8IIauavtvBhiWv8uMB/hvkKEQoMFmSU3UiaEUP1ezX
	da3leNYinpQ5kG074lW3+RZf9hWIhzWSG6UOxXiyjb9fM0Zj6mWIaxVgboQcVWr31gOG5nJc94c
	o6R+JMemYWTmLZ1RcZ+VWrjGRxfKluQ8Bn1R85uDkGVCfqfV+b5LtMjGNFS5sVj1zn7WB1ztr/y
	DFxMoSTUuRx4n7DCsWrUwDFTmqSakh181G1st+Vfixsh/sKISOo3fHulINYDtkWV1nU25FQOO5K
	oYqOty7ojsBFuBW7wYNxJzKEAvigjaVebi5Xth1GrQnhhSxv8J9Jx/vx1yzzcNNLzDgoNSnCRax
	4pq4n/a7XKGJ89TWr/hAyNxVz+2SmyzFD4Mt+roWW7txhL9LJmPp0=
X-Received: by 2002:a05:690c:4448:b0:8b3:5969:f25c with SMTP id 00721157ae682-8b520435b4cmr656757b3.31.1795104107663;
        Thu, 19 Nov 2026 08:01:47 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b52031aa4bsm623267b3.34.2026.11.19.08.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:01:47 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 19 Nov 2026 09:00:56 -0700
Subject: [PATCH v8 1/9] dmaengine: dw-axi-dmac: keep cyclic mode in the
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
Message-Id: <20261119-submit-dw-axi-dma-stop-pause-v1-v8-1-f8e7fe60594c@gmail.com>
References: <20261119-submit-dw-axi-dma-stop-pause-v1-v8-0-f8e7fe60594c@gmail.com>
In-Reply-To: <20261119-submit-dw-axi-dma-stop-pause-v1-v8-0-f8e7fe60594c@gmail.com>
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

