Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0EAC37A842
	for <dmaengine@vger.kernel.org>; Thu,  2 Jul 2026 15:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783006329; cv=none; b=NC+L7n0vUFvLk86Tml1jsRgCsccgodQkaZTP6gU8UUdgHYdBcgaEoqJF89l13kIl5RyJPl0eo+oT32ieK83BMNmzqXVrkwi6fcxGoj2ar27RRaU6MpkDS9SZ7eDTM21DtPyCRCF/ySohNy5r6/Cd2Zpm3wl7RnVhs9ddHYAW/ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783006329; c=relaxed/simple;
	bh=FzApVQfiQMe+KFDDKOPepOMUsI0skLMOonK6G5v6IyE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=tcFiY0Mf6/lDDpaPrBA2AwbAoWiEToQAR35psPGTGPxxrlAZXyq2JZS+yvZDaJq6+7Xe49yGfY7/T4a5Eny2UzKniALI+CAkwCMmWQfGV97p9vC3QBtGxbrg0UmEu4k9vXlPvkAODwCHfClDGHUJSa80jhN7nKxFeAA3XdkVjO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jzm3JnZH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jzm3JnZH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3CAC1F000E9;
	Thu,  2 Jul 2026 15:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783006327;
	bh=/mTDxEEXhf1dHuXuCAdsHsLXruAQZQS4VLT12t4ez0w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=jzm3JnZHFwt/mqn9jWUA02Owh5bjidWASS5DJ/T1BuIak6b45txHrmHFY2OD7kTFZ
	 hawKT/j3+DeENwu/Y4qX5BKoOhyukLWxpmaylheHpl2c7Z5XG4aMRgNC50WGmMJSaw
	 0XjMKWpCykkafVObJ/OJiT1jPiMefA25l0lSEszULIo4FK3HUvCjWO/vqYVZ7+QVMM
	 51/xXH/BTzmWnRbmA7xrnv6qTjzSrkx609UIL3LD/aZo8Q1+7Pki2XsJDQVO7oBdEb
	 F/nQ2vVaX8qeNOZ5f/EF1yYQjpGrC9AIxl9I/FbIZfBZNySVAIRGDLMZVUOJN+UMbn
	 6P0VdgzeHdWGA==
From: Vinod Koul <vkoul@kernel.org>
To: Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Frank Li <Frank.Li@kernel.org>, Vladimir Zapolskiy <vz@kernel.org>
Cc: Long Cheng <long.cheng@mediatek.com>, dmaengine@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20260701200703.117929-1-vz@kernel.org>
References: <20260701200703.117929-1-vz@kernel.org>
Subject: Re: [PATCH] dmaengine: mediatek: mtk-uart-apdma: Return -ENOMEM on
 memory allocation failure
Message-Id: <178300632440.735405.9920364004468870936.b4-ty@kernel.org>
Date: Thu, 02 Jul 2026 21:02:04 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Wed, 01 Jul 2026 23:07:03 +0300, Vladimir Zapolskiy wrote:
> If dynamic memory allocation in driver's probe function execution fails, it
> should be reported to the driver's framework with -ENOMEM error code.
> 
> 

Applied, thanks!

[1/1] dmaengine: mediatek: mtk-uart-apdma: Return -ENOMEM on memory allocation failure
      commit: 467265c750edd7ab43803deeafe7d3120a791d32

Best regards,
-- 
~Vinod


