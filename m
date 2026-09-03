Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA11F4F55B1;
	Thu,  3 Sep 2026 17:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788455104; cv=none; b=kEwyBD4a9Gpd+PwmzcrWIlUx0s6afYOfUAWnSt0b01UQVITGyIn443eufEYTEW20euXH5Lc7I36ZhYLr6TLJrPcTpfEN44MPSWF7hpBUM3cEiI1l0uDeVZdsGIY9vaGhhM/SNdUig0zIK3L0ABRmBfZZBgl/jufsTkkMnfOs//E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788455104; c=relaxed/simple;
	bh=GdiaDF7/pVaDnZdmT0wFDgSYTZ5oEoOufJSiwn4IpDY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Til5nGeEI1jfzTQK9WwcJOwVh7l75vhGRzLjQp+SDiI2spZCGXYkt23JM6QRgcOhFdXePzWHs/ob6MRGnKX1UE7Yx0oJtl2q6Xj2hcex0qG44XWOqlVpq6zH6/fQnLiDZrR6Z9DNb75Siun8L41TDgL0aL2MAu+4RJyse/+nxmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kpa0PuKT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kpa0PuKT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EA1F1F000E9;
	Thu,  3 Sep 2026 17:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788455103;
	bh=PWg9hCOLqFxOrA4F6TdJHIMFdDYu5fIc3xaiM79wORA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Kpa0PuKTgQmLiHG9kdJoZKCepP4pUgtmDC2oADbYk+GTYSUs+YgarBcUcP7s+4XP4
	 qqKHXCcEtUHLbqb7U2aawCpajPW0ycWyGDUWfGTMju1434BIpbEs8UabeY2zDO/3z5
	 4/8Tlf/bu7i5mPePS2ZpTUq/938qA5u4mdrTNvKFRRPfCYPiEKchNshfYS5x3Y+Y/p
	 KLvwyAuFTrjbL3nE3lG4p/clKKlCAKwuQkR1LjKPjG03Ek0gl6mw5zxUGMMIiuQEQk
	 z6WZ3Wl08HlBH4TGeglIjmKxDmdZyGU123ztGrmB4M8ag5HUkobFXbUp5bobR4KLgL
	 oZMr+t0nwcSNA==
From: Vinod Koul <vkoul@kernel.org>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Sasha Finkelstein <k@chaosmail.tech>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Joshua Peisach <jpeisach@ubuntu.com>
In-Reply-To: <20260815-t603x-admac-v4-0-1149e342dcb0@chaosmail.tech>
References: <20260815-t603x-admac-v4-0-1149e342dcb0@chaosmail.tech>
Subject: Re: [PATCH v4 0/2] dmaengine: apple-admac: Add support for M3
 generation
Message-Id: <178845509899.1711546.15996486451264669043.b4-ty@kernel.org>
Date: Thu, 03 Sep 2026 22:34:58 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Sat, 15 Aug 2026 12:41:37 +0200, Sasha Finkelstein wrote:
> The ADMACs present in M3 series devices (t8122 and t603x SoCs) need
> additional register writes in order to function correctly. Add a new
> compatible chain for those, and change the driver to do the write.
> 
> To simplify the merge strategy, the device tree entries will be sent
> in a future patch series.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: dma: apple,admac: Add M3 generation ADMACs
      commit: b16c2ef38cc45fa73a68aefa769c0139f6a53006
[2/2] dmaengine: apple-admac: Add M3 generation ADMACs
      commit: 40c92b5df91f5b4a7bf562a6829f044f1a748375

Best regards,
-- 
~Vinod


