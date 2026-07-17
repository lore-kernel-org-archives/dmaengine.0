Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731F0367F31;
	Fri, 17 Jul 2026 12:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784291746; cv=none; b=drW7ObhZmPi56EaHLbL3Sza7VXdlw3rgUmw1LMCL54U5x6BML//PzV0xpnYUYIT6EqdHEQevAv01QQFtFjw/MfIo19B8VBNG4h+OJjQcxs78rdWqre6txXzN5+Iy6FCRcbCmwXZrl/Da+df7gOAGVVHJjis3KgJvpqTmHp21b6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784291746; c=relaxed/simple;
	bh=h09/VtgfFCB6Zc3AHB6A6r9jmWYgwnCJzHSTbbOvBpg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hf9OV5VAZHIzqrTySKeNfN63Y+KYcipy2wZoAg7SRfSyEKITMFGkiwjHalwik1xnP4D1Rk5CUqG/NF0bzl9razQzOda5VgTfwyBq2qOt6rowjrD8GvMW87WWwHQ4netCKoEupow/QLdTxhu5qZhWT8VsRE8PtZ9RsKDZNP0Z9CI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dHPoq/2R; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dHPoq/2R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E6751F00A3A;
	Fri, 17 Jul 2026 12:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784291743;
	bh=mxG0WxQz0e4aZmu5cv0MnxZfcgp9+qQT6KEa6S6j8GE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=dHPoq/2R06RGXfBTgIS+z79mcKcGeGsmNh+VUrPFCG82lz2Mn3Dewb8jDCc7BPPlD
	 OS5nsXq7oRKsl8p2ZhM2LzpIkZpiY5JLNQqL9VkdvSN8VLggJfZ+GgGczg0H9U0HnS
	 t3VFK2gHuPO/e1Pkz4FzqYYfLhN/d3xW1B03v/RakLgr6wmQkAIjMOYSWzMnPLB4qM
	 DNrrj5zyCfOtq2pgIFWUiTiV44vIGBmuils4/glsG1Zpl19BtpCcPEYWUck50aPLwA
	 6DTfLsKONaezRJEAA2E9m6BZgqSx9qLQQir1hasycuXXW1N5QxrbyMjYS58sqYUFTY
	 7A7B0gy5kgKcw==
From: Vinod Koul <vkoul@kernel.org>
To: bhelgaas@google.com, mani@kernel.org, Frank.Li@kernel.org, 
 Devendra K Verma <devverma@amd.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 michal.simek@amd.com, devendra.verma@amd.com
In-Reply-To: <20260713064854.4065262-1-devverma@amd.com>
References: <20260713064854.4065262-1-devverma@amd.com>
Subject: Re: [PATCH v8] dmaengine: dw-edma: Enable HDMA 64R/W Channels
Message-Id: <178429174011.1176696.11757768768178402819.b4-ty@kernel.org>
Date: Fri, 17 Jul 2026 18:05:40 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Mon, 13 Jul 2026 12:18:54 +0530, Devendra K Verma wrote:
> As per 'Designware Cores PCI Express Controller Databook',
> Section 7.1 - Overview, HDMA supports 64 Read and 64 Write
> channels. Current controller driver supports up to 8 read and
> write channels only. In order to utilize all the channels the
> controller driver need to have the channel related structs
> and variables as per the number of channels supported by IP.
> Following changes are made to enable 64 Read / 64 Write
> channel support:
> 
> [...]

Applied, thanks!

[1/1] dmaengine: dw-edma: Enable HDMA 64R/W Channels
      commit: 64173b6b7609acb88fb763041c9e496caa6e834d

Best regards,
-- 
~Vinod


