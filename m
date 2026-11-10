Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794279746;
	b=El4y0K9MbTJlc2xcSsybdgX1nJbQDJeSsPR4es+AsoP5ECPvGbgJecmM6K1ZQUxCf+sE
	 NLcHGTnlUOxb3erDJ2gZcDM/r4BEFP5cZl14Om091nrd6LAyX1v2GN7zgd1IYJegvhM0/
	 SewwsfhYnYcPjaVeRYvoNodFsmAXwjq1yVYRzbpvkSBnr511VP3MztT3qvHkjpktoQs9V
	 GSUJjHtyx24WUPgFPBY+SFP7roe9i5aj9VuVKfxQcy8bzOa0oDaU8tG2xauq9jOr9HKi+
	 YTl/W8cHK6RJd84/fuehuCyl3K0o1BmnDeFrx70OXdOJ0qlZcyjZMQ20cIyWpGkqnqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794279746;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=lNlAAFeqvPs3+2DrLUisJfKXmiq6ODin2NN2Dn+TzsQ=;
	b=QaPCSbsItNUV8J3iXkwbWLumUGy6WqHKOn7el+WOTaTz1tfiCWwr0vsccCL4Kus0Z0eR
	 dyIkbqH+B30r3Iok3TjX6Q5rnoCW4DQEhdnwVUBnScWpIpx7MdY/xRsh3wrd8aeQMUfn9
	 k2PcrFEACiIAjPKuf3ejT5g8aDth4Shg/e7BlxRNf7aeGY7lUU7krSA71q0HFrD3ZuGPQ
	 mzdOG6aNKOxCRTOrosJc3WQEehmImeKJ2hvGzfirN3Fpd8buBtE0SA6WkKGGfNGA/msDq
	 nDSXllWrp5pFZHQo/0g7SmBX5ftW1zviBfEqNmhx2n1JsgY1Q5kssIe0VIwlOGmonVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gFbBk4Zv;
	arc=none smtp.remote-ip=209.85.210.51
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B72606A321
	for <dmaengine@vger.kernel.org>; Tue, 10 Nov 2026 03:02:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3B72606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gFbBk4Zv
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-843ea301d60so864368a34.0
        for <dmaengine@vger.kernel.org>; Mon, 09 Nov 2026 19:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794279744; x=1794884544; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lNlAAFeqvPs3+2DrLUisJfKXmiq6ODin2NN2Dn+TzsQ=;
        b=gFbBk4Zv4HAt4Wxj+pKFz4aUR6pmLgUYtSl9v4+p5Qa2ZurJFBBsdjonxf6lmsYMGa
         fRBWiOb5lhEaD4kGO6T5Y5PQcoUS9XbE1F9vVPW29HUDvlIdrnfWwAyg01diShoK77C1
         MC9nGnbpBtO3NTY3NiIVQO01wk6HO4x7tc7yKdoFJx5/YohrMKb+E3NhgShT6d6yJlhE
         YVR4qxvny/1di+qAfMiizlOUuwMc4DTKh373Drz2wT9jq56bgrDHiQaWJWMLm1NQdJoG
         xSqZmPpqudZoM2duhXKvY4l2uJ6/wrDCaJjI8z/DpE41YpddAghl1/6zJ0RBMcC35kYD
         3luA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794279744; x=1794884544;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=lNlAAFeqvPs3+2DrLUisJfKXmiq6ODin2NN2Dn+TzsQ=;
        b=DcW+PVj3/dkmUB9gkm9zLH+W9LFSb+YVy1kaB2fMcDxg3zW9PzL7iUiMDjNbmbQhe5
         yxhXRSDJSshwrGieGk17vPk713uDJMgch3YrliPLAB1QwCmrfZbKJusN4A1rHadPFHQv
         X3ulujnUxIS06MhU56k/rVMm2bVFNI8+nTb80xFy3SefBWfRuR2PE3Hu11W7AayCB/Je
         2E/jlNVyIQsN+a8Fycp+nTb1hz+mZQfDCNWnbYI+0xxy31TFa07sHW2AXojegHEXIGhl
         BQwi7WS4Mq5mNUMUUwC0o0kJd6MR4QUSS5Uk0rJF3vln6jFzpQh8QofL6nwDxXPInYUv
         Uopw==
X-Forwarded-Encrypted: i=1; AL+hErEoi9FMF3MsCj7hcwsdtnJu9Lic+gq3vLGkNagUoybuaNTyC+zFSic3Ne+vINveyp0iQSzMQwFzxsY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/8wOudRRo/t9LQjDYmJAvNGoUoufJF8DMXUMifCvuwIcpNLyxM
	0kTFomBlo3DcdQI5vDMssLV6B9aeQxqCIlUbbWo+67uxAXUu4/Dh+6C6
X-Gm-Gg: AYBFou2eVwzzc8SpV4iU0b83LAsl4IqS1Ut+mq7H9AlTXhazQ6WFuIiW58dLOEr77+f
	NqR9EXCcZKleVWdk2i3ZNG6Hvogk7cF7Ia1f+lKKX3TWM1bhKSZsFNTtJWPk0R54Na77XkpGi7Y
	FMurI6jGcc+Ri1IEWD8/wd8nGvrxRhI2BOuCKBRYX8W+M7MipEtdz6JDJm7lLVRqunGeIehLV4m
	zZO9mT5OU2Zz/lpX+GI01pGTH0+eNxsqi6qZOmnffx3NzYMfRZ3i9HQ5conBByZ+5ZO4WsP/QUu
	Yww8mqEBG4po7Q+dnwHTycR5B9PuoCxq6K57nezCjJrqEvT2KVbptIue1jFugEhBvhgz554ecG/
	Iu+TVBNZvOcxXbXk13G6DwET0UEOYguvANH7oLyEG7Xl55v6qpD1Ij2tlq65gleGVg3mZqKtOOp
	wnpcC6eT5B1oGl7PJmvLfEtsuhefzlWsmuDENysAmlRYTpTH6FAohSOhKsAFmzw55Dw7Pkj+ed5
	gWcnN8xB3O5QP2ZYB9sd2/lZW4LJwZiTNwmw1GyAPfQbf8PtHVTrjNVnMxSATkU2VBjYhi855ik
	cIWDVbepIpAz/5JRJ6zFtswyh7z2luRQTyOkpRPYEIlH7PhSJr6K9seAigewE2vNpZYcuNR+VRO
	4WVP/OvCcuYE3+213sNSkY7qWSLO6KKkTUVKlaYdYj9j4jbv9qdco4M5nW6Atf/Egdeek8f/K2y
	cUIqhMQcE5Q7SG5eSCK9yCzt/3L5Fc6b7rkcrRzJ4OUl/YVDNiMwU=
X-Received: by 2002:a05:6830:913:b0:804:365a:bb82 with SMTP id 46e09a7af769-860dc818e73mr1351189a34.22.1794279744586;
        Mon, 09 Nov 2026 19:02:24 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-860dcbebfc6sm882545a34.18.2026.11.09.19.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:02:23 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 09 Nov 2026 20:02:14 -0700
Subject: [PATCH v2] dmaengine: tegra: only advertise supported pause
 operations
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
Message-Id: <20261109-submit-tegra186-dma-pause-caps-v1-v2-1-accf568bf0cc@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WOwQ6CMBBEf4X07GpbFMGT/2E4LO0Ka6SQFoiG8
 O8W+AKTvcxm5s3MIpBnCuKWzMLTxIE7F4U+JMI06GoCtlELLXWmlMwhjFXLAwxUe1R5BrZF6HE
 MBAb7AJOCLDtblWppL1KLyOk9PfmzdTzKXUfIi8ywgldHhTFeeXSmWV8RSa5mR6c9Fx0Nh6Hz3
 23mpFbSP4viKSiMKSp1RZmm9l63yO+j6VpRLsvyA7Q7gp4GAQAA
X-Change-ID: 20261108-submit-tegra186-dma-pause-caps-v1-664d1320d502
To: Laxman Dewangan <ldewangan@nvidia.com>, 
 Jon Hunter <jonathanh@nvidia.com>, Vinod Koul <vkoul@kernel.org>, 
 Frank Li <Frank.Li@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
 Pavan Kunapuli <pkunapuli@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>
Cc: Rajesh Gumasta <rgumasta@nvidia.com>, 
 Thierry Reding <treding@nvidia.com>, Akhil R <akhilrajeev@nvidia.com>, 
 dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Tegra186 does not support pausing a channel, but the driver installs
device_pause and device_resume for every variant. Both callbacks return
-ENOSYS on Tegra186.

dma_get_slave_caps() derives cmd_pause and cmd_resume from the presence
of these callbacks. Clients such as generic 8250 therefore accept RX DMA
channels that cannot satisfy their pause requirement. A receive timeout
then reaches an unsupported pause operation instead of being excluded
when the channel capabilities are checked.

Only install the pause and resume callbacks when the matched chip data
advertises hardware support. Keep them available on Tegra194 and later,
and remove their now-redundant checks for unsupported hardware.

Fixes: ee17028009d4 ("dmaengine: tegra: Add tegra gpcdma driver")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v2:
- Remove the capability checks from the pause and resume callbacks now that
  they are registered only on hardware that supports them.
- Link to v1: https://patch.msgid.link/20261108-submit-tegra186-dma-pause-caps-v1-v1-1-9cc9b17a033d@gmail.com

To: Laxman Dewangan <ldewangan@nvidia.com>
To: Jon Hunter <jonathanh@nvidia.com>
To: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.Li@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
To: Akhil R <akhilrajeev@nvidia.com>
To: Pavan Kunapuli <pkunapuli@nvidia.com>
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <treding@nvidia.com>
Cc: dmaengine@vger.kernel.org
Cc: linux-tegra@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/dma/tegra186-gpc-dma.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/tegra186-gpc-dma.c b/drivers/dma/tegra186-gpc-dma.c
index e76c58f213d8..bd606b71e714 100644
--- a/drivers/dma/tegra186-gpc-dma.c
+++ b/drivers/dma/tegra186-gpc-dma.c
@@ -419,9 +419,6 @@ static int tegra_dma_device_pause(struct dma_chan *dc)
 	unsigned long flags;
 	int ret;
 
-	if (!tdc->tdma->chip_data->hw_support_pause)
-		return -ENOSYS;
-
 	spin_lock_irqsave(&tdc->vc.lock, flags);
 	ret = tegra_dma_pause(tdc);
 	spin_unlock_irqrestore(&tdc->vc.lock, flags);
@@ -445,9 +442,6 @@ static int tegra_dma_device_resume(struct dma_chan *dc)
 	struct tegra_dma_channel *tdc = to_tegra_dma_chan(dc);
 	unsigned long flags;
 
-	if (!tdc->tdma->chip_data->hw_support_pause)
-		return -ENOSYS;
-
 	spin_lock_irqsave(&tdc->vc.lock, flags);
 	tegra_dma_resume(tdc);
 	spin_unlock_irqrestore(&tdc->vc.lock, flags);
@@ -1518,8 +1512,10 @@ static int tegra_dma_probe(struct platform_device *pdev)
 	tdma->dma_dev.device_terminate_all = tegra_dma_terminate_all;
 	tdma->dma_dev.device_tx_status = tegra_dma_tx_status;
 	tdma->dma_dev.device_issue_pending = tegra_dma_issue_pending;
-	tdma->dma_dev.device_pause = tegra_dma_device_pause;
-	tdma->dma_dev.device_resume = tegra_dma_device_resume;
+	if (cdata->hw_support_pause) {
+		tdma->dma_dev.device_pause = tegra_dma_device_pause;
+		tdma->dma_dev.device_resume = tegra_dma_device_resume;
+	}
 	tdma->dma_dev.device_synchronize = tegra_dma_chan_synchronize;
 	tdma->dma_dev.residue_granularity = DMA_RESIDUE_GRANULARITY_BURST;
 

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261108-submit-tegra186-dma-pause-caps-v1-664d1320d502

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

