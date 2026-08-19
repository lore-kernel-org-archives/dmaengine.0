Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43982773CA
	for <dmaengine@vger.kernel.org>; Wed, 19 Aug 2026 22:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787178962; cv=none; b=nyWiVj3zBXaoOT+coBsW0WgSXou0y0fS+bviSGZrRq2BhDsCbik/Co63O6fctCc2/sTw3AdDirm0ubdzxtspac/ptSKDVl731vhhs1bnLLAnOEaSQX72VgjHg5OMw/kiM/iOvb+VNYxTgo/5LQ5648dgv4AYxYKO2TdOom6Qah0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787178962; c=relaxed/simple;
	bh=7oMW6SLumthhdvXuxamCGUhe5tFM5ibM7r6Emwz3s0Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kiPiCFrK6sMxr82Cv0Jwmyd72KDZj8f2poXL5KsHL2f047kjC42bFCcDMdo6fSbrqHSKjQtQ9el5/0Wovirg6lu/FLwhgSCOS5kNQerR6Hy+R6xsZXSAF6JySWhsI0qaD56EEjxy59Kg57cw+B4ntAktEYYkvPDfeLSOij2Mnq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bcCMeEfd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bcCMeEfd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CD201F000E9;
	Wed, 19 Aug 2026 22:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787178961;
	bh=BDE0iyzRslPaDq6GRqEQrwu1T/iEfSfdjWdchyf74Ok=;
	h=From:Subject:Date:To:Cc;
	b=bcCMeEfdilATo1AG7NjpSt8qgZgaV/QOG6MFNpRaQ09hUWBZiSN/9G8FDAmgIc2y5
	 591OKrY7u/NhhQgHqGDNfdlUMh93yjlBa2rfwTJjFt+vF0tnmJpPxAvU+iX6O5DSR7
	 /c0moKdH1bLFW8vrSQuclgfCu6Ejp0W5y04DuOrgULwpEzi5aNSIQpIGpSeFvP4YWz
	 bffsFo3UMNtQ6PEn7PIKGtU6X5hFWl36Szy+BC66g9xZZ5g2+jAFR1hlXw/T99JL/P
	 Tl5Gghyc28fleyK9G33FLsYeXDuc/+IJukEGlTCupWWce+0g0cF5Bgy6t16S79DNHz
	 IXdSVh8c25h5g==
From: Linus Walleij <linusw@kernel.org>
Subject: [PATCH 0/4] dmaengine: ste_dma40: Fix probe and allocation bugs
Date: Thu, 20 Aug 2026 00:35:56 +0200
Message-Id: <20260820-dma40-fixes-v1-0-5e14815ad689@kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3LQQqAIBBA0avErBMmCcmuEi00x5pFFgoRiHdva
 Pn4/AqFMlOBuauQ6eHCVxIMfQfb4dJOioMYNGqDk0YVTjeiivxSUd5aF41B1D6CHHemP8iwrK1
 9wEQN910AAAA=
X-Change-ID: 20260820-dma40-fixes-b99af66002bf
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
 sashiko-bot@kernel.org
X-Mailer: b4 0.14.3

This series fixes four pre-existing DMA40 bugs found while reviewing the
Ux500 LCLA SRAM power-domain conversion.

The fixes cover failed hardware-start cleanup, probe error unwinding for
runtime PM and IRQ registration, and validation of logical channel indexes
derived from dev_type before writing into lookup_log_chans.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
Linus Walleij (4):
      dmaengine: ste_dma40: Fix failed start cleanup
      dmaengine: ste_dma40: Fix probe runtime PM disable
      dmaengine: ste_dma40: Fix probe IRQ leak
      dmaengine: ste_dma40: Fix logical channel bounds check

 drivers/dma/ste_dma40.c | 34 ++++++++++++++++++++++++++++------
 1 file changed, 28 insertions(+), 6 deletions(-)
---
base-commit: 0d995da5fb97e8c312834575604d4423eb6225b7
change-id: 20260820-dma40-fixes-b99af66002bf

Best regards,
-- 
Linus Walleij <linusw@kernel.org>

