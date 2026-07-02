Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9C73D5C32
	for <dmaengine@vger.kernel.org>; Thu,  2 Jul 2026 08:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782980533; cv=none; b=hX5aoKR36W979bmoOdyr2HcuHoYk4jGgeEyCbQtlmWeysbFaNlHR1ISrbMFFuHb2FiFyYp+Jh3h+SWGQKTPs7YRo3w8asI6SrXZbmNdDuhv7k+kFux5u8HecV3LLdFZEiMX7uOuWTkawkbVdGqvliTrLxgTsXEijZmbCK6ws/Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782980533; c=relaxed/simple;
	bh=SdqZifpTME4P22Rm/5g9MNYujks2ExaR7a48hkpIJro=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H0MnxOo9OUn35nFj14e88tk+UizErimPjZxbO8/tTzyVfS0C5mJ3Ds+Wqo3R6UV/+HoCfygvO7huQ58P6/yP6agiuDeqG2Ii8L6PHc2dJxlWcuU/mSFadQuMPZDq3cYV8NCBs64zkYpU83HKxgDQUHi04ekwMjIn0CS5MxpQqh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=n5kSsWaz; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="n5kSsWaz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782980519;
	bh=SdqZifpTME4P22Rm/5g9MNYujks2ExaR7a48hkpIJro=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=n5kSsWaziA4wYy9eg1SkTnkPsFwzss2nhBTUTVLS+eB5n+eTv0q/6BjhoK9hnBVSj
	 hXmpn1MDV+VEmPZQKfrTVLlVJzCzlEcTVHpMlA99R6cpBXDABpKnZiQsMYUkW9pOwL
	 28hLLXCvB/CHqPa67Yimua34P0n8xxdA3CcVCjvxMLLFPBLdd6U0FfCkFv/oCa6Tq8
	 Dr+6Wf5PT21tnILYGJDRb7cxVCI6/m/6wnkjyDRrFTBzy2ET2PU15MyNbQmdzTFBQ6
	 2j7CyUF88LrFJFf+VxTG6kvIwE6jzdT5puB8eP/ZQXvFO5H8T8r64aa8hOueyBBfQr
	 BHmK4guGikP1A==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A8C2D17E00A0;
	Thu,  2 Jul 2026 10:21:58 +0200 (CEST)
Message-ID: <d740db6f-10f7-4531-98cc-33251a01b9ad@collabora.com>
Date: Thu, 2 Jul 2026 10:21:58 +0200
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dmaengine: mediatek: mtk-uart-apdma: Return -ENOMEM on
 memory allocation failure
To: Vladimir Zapolskiy <vz@kernel.org>, Sean Wang <sean.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Frank Li <Frank.Li@kernel.org>
Cc: Long Cheng <long.cheng@mediatek.com>, dmaengine@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260701200703.117929-1-vz@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260701200703.117929-1-vz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/1/26 22:07, Vladimir Zapolskiy wrote:
> If dynamic memory allocation in driver's probe function execution fails, it
> should be reported to the driver's framework with -ENOMEM error code.
> 
> Fixes: 9135408c3ace ("dmaengine: mediatek: Add MediaTek UART APDMA support")
> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

