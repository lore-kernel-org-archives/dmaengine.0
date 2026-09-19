Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B764E370AEB;
	Sat, 19 Sep 2026 22:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789856571; cv=none; b=jPgM8GAdy8vCnfQDHS1bUtqwGgBXVIVoXi/2T08LwoZoIh9qcr9PAzkLUoh/jMPbF7EF0lJ2tOf9XJr6JMA/69xDpJQ+ihp2Gqb4bpo9jz6PdCbHuzx20BmOPAuEfW/SD2etvVmNasRmWSwax1Mu9AG1r/jlqnIj1KWSfQnmeLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789856571; c=relaxed/simple;
	bh=GeIcJFGjiASbYne9ejjuO6E4L6u2/Gft7Js25MP9x+I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TQb6VTWGeVXeT/rHWWBnb2wWtLLrsjj//+1mfLD6gt5nGmi1oVx2RealosR415OavfQutDbCEORwfk+FVlspwpTyq9xIp2H1UkDmiXc8JFZkl4Wdj+YtktgqpiDVdOElkEjKgvWeQjaqYZOdfBKglBYco0hJziNuuKHv1xpfXc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XTY7vv1Q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XTY7vv1Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C91A1F000FF;
	Sat, 19 Sep 2026 22:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789856570;
	bh=fOLxKuhSAO8Mt5GVnqerzGo0o9u3xv2Px5AvZkKzy6w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=XTY7vv1QqKaFLgA58NVWEde0gNkQYEzFefdFXBiUIKeMSgWAhNN7NMGWg7Y1MGt3X
	 ZJBKhh4528N8voYC0OYsJgg1/Q/xSRO7CTXS3pf4Cx8oEdCWKos1/NSfpTP5fZxTdM
	 bgILyFi6C+CufFVD+NcCKk9eDhrm89xSlExwsjKpIF9q63stzi8yvSaDgMGqI9rLKO
	 Guh8kdUtrpxJ7Xtlbgtfndwv1zUBORY1Cb5k3ljCRpXRN429bnAVJKX9CdDvm5tbDH
	 kqnBIuRtrPlx5ZVJPcrE9NyWD8nDN39ALIQh9X8sWi8BWToE/f5GmFOm88KnhA32dK
	 qgVECft4Nu7Bg==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 20 Sep 2026 00:22:30 +0200
Subject: [PATCH v4 19/23] dmaengine: ste_dma40: Fix logical channel bounds
 check
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-dma40-fixes-v4-19-d751b2d9c23f@kernel.org>
References: <20260920-dma40-fixes-v4-0-d751b2d9c23f@kernel.org>
In-Reply-To: <20260920-dma40-fixes-v4-0-d751b2d9c23f@kernel.org>
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
index 35cee6e48558..fe9759787981 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -1850,15 +1850,26 @@ static int d40_validate_conf(struct d40_chan *d40c,
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

