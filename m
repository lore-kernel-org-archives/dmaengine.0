Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794960476;
	b=GxetbVZ8+dDXWlabSCj6f3k33xlnWZCLacS4b2W32+DhcCGxJQWJ7bc9S10Jw4I66REV
	 vH1jliISSFjdyPJ5BgNOcoDQlhb9dAhGgeEvrXNIbzHajEoIiLxYzvVvAxJPIO4A6j5cH
	 kYTOCkgmlx52pwYS9iTmEWWhD/M3DHBV8gE74cYCuxHrk9JSfJF4YDHknwdSlCohm1REh
	 K9ZxHbEk+UXfTFSr1PQFvFiLjoJ8sIHghpmo1B2iFOKJxubTy+JI6s0cp1K8JD5voJLIt
	 ASvIaOvjh33oLCGorqFyuhUO9oUVIhBZKUj6dhZCdtc5J3KggbkYCtxTI8AQ4TKXFnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794960476;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=8RGDeXbdt83hUd3Brk6p8Eodv6wi4lD1lBh2U2cXcg4=;
	b=i0X00H0pwIe+dh37Q9eRAvVLTs3CO0pbTgndPRQPw/nkU7HeI94va7A5GcFHubAXcw7k
	 k1qnSVw9xiRPKENd9af5GfOyKDjNJJ8g/jHjvAaSsu2tFDfepzpD/Vn95kO/sF8MDq81j
	 pvMPm9FEwYHYvHREj8Hr1BYoqTi4toFOqheObSWhqRXFOqwWgbtMnr9b98bCAtdtHe1U3
	 2mS3u7Nhok0HG/OH+qUlqP7rFDX1ioUiP61K75+RZIY88HLJ8x6VjWXTuWxUBx+aWtLSY
	 ioRfotoN0jRBsW+1dHpY4Xr+ncKtfVFYxkMAYjxmOfkxvJbOV+NkPBdUK6LYmcjaQpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zOt8eDQ9;
	arc=none smtp.remote-ip=209.85.160.50
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB9B606A339
	for <dmaengine@vger.kernel.org>; Wed, 18 Nov 2026 00:07:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CB9B606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zOt8eDQ9
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-48eee44b908so251923fac.1
        for <dmaengine@vger.kernel.org>; Tue, 17 Nov 2026 16:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794960475; x=1795565275; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8RGDeXbdt83hUd3Brk6p8Eodv6wi4lD1lBh2U2cXcg4=;
        b=zOt8eDQ9hpHAcp8EP8ZMgHNhc/ZlvAAtQuaDsUqUgahBUU/h4UMThDO7N2KXkCTAi7
         XqAGGCeBFvifMwAG2FhIkzOc+muP+dnJKLkDV1a9a3bWSWim1SxWh1mr6IcktIJnbfxo
         M01Qv7TZoMcxC5jZLhSbKQ5Dp0DmTFZ2exVoql4FNYsmEPloWiKuOJhfIAagxa4wL7eZ
         ge4opepllw6wDrFayKiLCeUO/eOfdECJKAOEg7quAAuSxaFOhIG+FEHf5Sc58bvRfcxM
         Xf0tU0DSfCf8jbWH40QxpWRumTM/EI/lTyvXE+u+6fZrT3D9VngcYHNVCMeY0uONlrhd
         XDBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794960475; x=1795565275;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8RGDeXbdt83hUd3Brk6p8Eodv6wi4lD1lBh2U2cXcg4=;
        b=1AM8j3plTmiFFlwvFBIPdkWlQOdA/Q4XbB5tFJXf6YI6H94w9ppF/Z1knUXV5A1Png
         a5YXgwDoCkfZz9tLSUCUtjbe4OJi0xOeH82yQlx9hhx0kkS/iDct9HBbtuT1ydMEsHRM
         rHeYmP0uTZx8OAg7XhfO99ZBlUgfJeKJFuwnFR3lDLMugdyUTSiOFxq4TtQmQnMqn67w
         e30S4rDCQ3m/oa61DWcPnnBNQHpsBpbxnQZfocvJYWaDLz6tv+YVUQOsx78bmfvdIg7t
         36x6eYUX0mDZ/Z8awgP2tOMetm8BtoB1+2gGBWT/f5bjG/qB+7W2X50ZCU3LC8m/Nh2l
         ZmQQ==
X-Forwarded-Encrypted: i=1; AL+hErHtFK2Uoj8wegVTjBlGF2/z5Ho0yBw2kmYo7fqRBl+boraNhSxHq+NUORHfHZGfdyvb3DFrBUf4IA4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9x6XYoJkkzIbvsc/DYW6qVCQ9tMYVKkPECjI6I+Y8xlYOaZqqt
	SeOdwlW8o3AGyUAj/tbonOiKY0LkMEfuX/0D272AOoezUCILUx5EzBrX
X-Gm-Gg: AYBFou0OsLtawH+9WQ3TPOsh+s6I/GNq+W6+hkgpIkIqZOzEKkRXeyCKx0w7F0RKSBz
	8grNXeIKiuqJuyylUPry+paJ6gojHXBU3b3m3kNpmi2wlaoOAKK3b63K4HXIX3sLr2fAVHYv2xu
	sUug5RulW2ejt198VzDZvycnCBBxmqnr1TVO4x1YoLXQyCZPBBiimR8ujoYys//lWPTwkt/jIoN
	qwVx1PWBYQ+30B/S+l2QbL/gMix4R9Q0OeWKf9aG43jToS6ylt08ejH9XPc/yAPR/3qZfGANso5
	D8j/0xtW1F5rOb0leeCRgt4feCBDCwTeaG7jLZPVlVqC3/qFq7EbK+UETXh1ZEevcmnxNn/TfDr
	21Z/31v8bK00xXd3yYd1EU/QcBu71ND2y2f3BHR9td0iRU8d+C2GvCdv9n+h0gTIyZEq7jX1Iqw
	xR+CWWkT8EDM28Fk02OkylWJ9LlpuFOQaEwig/u+3PUOB63oijMQ/F6DwuCPx12fFNv2CNYd2nH
	dOEvJSNMl0OpjlgnHRbx7LSjRFcjg/PWPx0qU2f5HQTHn8vnAnIlVBl+VqatxTiMAhS1j/4arbe
	Ry/0hUSsxnaqmMCOy6VUED1ohSGUmHwrODGLcYGMnaBu7IUAJ3rQf7aWL+BXjiG7HUCFSZGjWRQ
	h3gtfErAKmDxwUnvNwmO183oVtskdZ1SwCKWi73PLHBs3MsZrzh/rz3QJUUfYwTalyFiEm+WtUA
	ltTVKPLYZ/1HzaPqUngugvPyLYDn8WrPPVsBUzdIpQLqsG4doDRIk=
X-Received: by 2002:a05:6808:14c1:b0:571:3ee4:9a63 with SMTP id 5614622812f47-5773d82f896mr1508695b6e.52.1794960475100;
        Tue, 17 Nov 2026 16:07:55 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5777b393d40sm434954b6e.17.2026.11.17.16.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 16:07:54 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 17 Nov 2026 17:07:40 -0700
Subject: [PATCH v7 1/8] dmaengine: dw-axi-dmac: keep cyclic mode in the
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
Message-Id: <20261117-submit-dw-axi-dma-stop-pause-v1-v7-1-d5f2309afd72@gmail.com>
References: <20261117-submit-dw-axi-dma-stop-pause-v1-v7-0-d5f2309afd72@gmail.com>
In-Reply-To: <20261117-submit-dw-axi-dma-stop-pause-v1-v7-0-d5f2309afd72@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Sergey Khimich <serghox@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sia Jee Heng <jee.heng.sia@intel.com>
Cc: Mitch Barnett <mitch@accuratesound.ca>, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org
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

