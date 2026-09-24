Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED89830C618;
	Thu, 24 Sep 2026 08:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790238950; cv=none; b=TZ0a2AQdvhiYtf2Pj3jHLeSTPnq9uo0I3/YkZNxm9RbfSLTBxrAfY2MSc9DbuFLV2050K0F6oJAgUXOzsW/OhaIBNplBhBWqWZD6oAsdPMxx6TW7Un2bDhRat+soym1uZ1p3ChfFux9YsEE7/4IKZAWY32C6f37MtzKp9G9PO5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790238950; c=relaxed/simple;
	bh=/EMi6c1yotf2l3QLmAe3G+U2bM3fTLRvgoPdENdRTmk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J/joKRWkJ9NOBoNR5hwKFKSZx9H0ZzRjjmekGi+4tG0qYdXQh4CBXYY5eFoncxx5it11tLN4TtzwyNisy5md/cBh/SAIIzhTZwz6ToXNPLi5Tm19AGEPOh4ozGnPui5rzmeO/1sL+27Gj3F3ErR3fAnWhRAViGzOx6qDe3NG8sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CJF9wiPl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CJF9wiPl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5462D1F000FF;
	Thu, 24 Sep 2026 08:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790238948;
	bh=9HcOtR/YRtwA/lugkS9gc26dEnALc5wtSHbucBS2OzE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=CJF9wiPlkqUlTfGv9dxmzbKp0c5JDmILYu6MSkQVNd/w4TjCM0m/xEg8YwN6m1riR
	 lLn1x+XPNwt7xdZHiaQm/OVcGhrGJ8QVEeFnZ6p3hHxqIx6jIzaFw2zF9wkLYKlKM5
	 wfl48hBHh0Y9MXlLFMGnQs6OXC/SwzpLawl4pHrntaIH01Ww3zuZeXgu56A3w2AJIJ
	 LInn/DZVuKrBLahg0iacwpXXGpR5XtiGWW7hSOq2RAbqJDktJTD7R2Ka9bohqvX2jQ
	 /G5rYuH7rAI0QSemnWjj02RDEtTepq0faS78N6qW3+MBR0UHtj8frZuaPkyAHflEt/
	 81qBi00xRVGVg==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 24 Sep 2026 10:35:31 +0200
Subject: [PATCH v6 19/23] dmaengine: ste_dma40: Fix logical channel bounds
 check
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-dma40-fixes-v6-19-fdb6755020a2@kernel.org>
References: <20260924-dma40-fixes-v6-0-fdb6755020a2@kernel.org>
In-Reply-To: <20260924-dma40-fixes-v6-0-fdb6755020a2@kernel.org>
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
index 4f5839691b85..8b13f1360edb 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -1884,15 +1884,26 @@ static int d40_validate_conf(struct d40_chan *d40c,
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

