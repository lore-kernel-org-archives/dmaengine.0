Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF886514773;
	Fri, 18 Sep 2026 16:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789748700; cv=none; b=utttdbVKfR16jZYO0nPTgtofJECPVUGi+h1hBwstbEMy1kUGvxsTJJmXo8tGLfYDE379k4HSjmnB4ZWf9M7RcDvX6zfuqNWsSVTr/vjBKfdxLigbmWfMpHjqSiWVEQiR/6QCujnoZiZvFBHwr/1IDAMNej/5uofB/1gJOHAiFi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789748700; c=relaxed/simple;
	bh=IeuybGlD/vsd0j/JBEKHlAj/LlQg6m1OwhTLG2Uk7Ps=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JXIR2+moQ4HaWjTYpMGev0X5O9c+S/eRJMR4T5XPQQQpI9Ue51miERjzASToyJuBo7inctqQZjGaEmikFMh8MD/CvslLgsUjWc5qYhNkqy8GtVP3Vh7jCze39IR+/lN2tJMASgrC3HHtoS792z739R2KUAJfJvSWP+hcDxkigDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VG5OQfId; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VG5OQfId"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AFEB1F00899;
	Fri, 18 Sep 2026 16:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789748698;
	bh=wkryeIkSSqy7KBYuAkcyk3xtv5lYGby4SWBPi0IFsiM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=VG5OQfIdRz5OxtJ+7v1WASXvB3eTESN3V3XFf1zWf8jPwEBDumpxJPGiBF3tjgXzH
	 UwV0IQ9uDqCCbvfx/8DQSIu8hRTDRuVl1HqGA3Y6GmgGlXMlGpkwFHi/JRvWLPzgqf
	 +aPQjhuABxDwJnHNuidfhRMQseNgS8WTAzKN8Gb8Zu5s14JCwQ4TvtrUzQDnAYBkK/
	 /OOXKBaB6SKVAosfqxIEtgpIlKF1ahIbZdEqcKDpPzgs+PN9aW1JT3RdZzfIISWogz
	 gQCzXq7YCu94w3nTlc5HUZB4INjrV97lUZSNnZG20gADhIcRyBytBXoqiaudm1aLSV
	 oa2y6NanrGhPQ==
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 18 Sep 2026 18:24:37 +0200
Subject: [PATCH v3 18/22] dmaengine: ste_dma40: Fix logical channel bounds
 check
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-dma40-fixes-v3-18-8dd8450669e8@kernel.org>
References: <20260918-dma40-fixes-v3-0-8dd8450669e8@kernel.org>
In-Reply-To: <20260918-dma40-fixes-v3-0-8dd8450669e8@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, phone-devel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>, sashiko-bot@kernel.org
X-Mailer: b4 0.14.3

d40_validate_conf() checks the raw dev_type against num_log_chans,
but d40_allocate_channel() derives the lookup_log_chans index as either
2 * dev_type or 2 * dev_type + 1.

Validate the dev_type against the derived logical channel index limit so
channel allocation cannot write past lookup_log_chans.

Fixes: 26955c07dcf3 ("dmaengine: ste_dma40: Amalgamate DMA source and destination channel numbers")
Reported-by: sashiko-bot@kernel.org
Closes: https://lore.kernel.org/dmaengine/20260618051539.15E201F000E9@smtp.kernel.org/
Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/dma/ste_dma40.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index 07a940a26074..26dbef630eef 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -1750,15 +1750,26 @@ static int d40_validate_conf(struct d40_chan *d40c,
 {
 	int res = 0;
 	bool is_log = conf->mode == STEDMA40_MODE_LOGICAL;
+	bool invalid_dev_type = conf->dev_type < 0;
 
 	if (!conf->dir) {
 		chan_err(d40c, "Invalid direction.\n");
 		res = -EINVAL;
 	}
 
-	if ((is_log && conf->dev_type > d40c->base->num_log_chans)  ||
-	    (!is_log && conf->dev_type > d40c->base->num_phy_chans) ||
-	    (conf->dev_type < 0)) {
+	if (!invalid_dev_type && is_log) {
+		int max_dev_type;
+
+		if (conf->dir == DMA_DEV_TO_MEM)
+			max_dev_type = DIV_ROUND_UP(d40c->base->num_log_chans, 2);
+		else
+			max_dev_type = d40c->base->num_log_chans / 2;
+
+		invalid_dev_type = conf->dev_type >= max_dev_type;
+	}
+
+	if (invalid_dev_type ||
+	    (!is_log && conf->dev_type > d40c->base->num_phy_chans)) {
 		chan_err(d40c, "Invalid device type (%d)\n", conf->dev_type);
 		res = -EINVAL;
 	}

-- 
2.55.0

