Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82CB7448CF7;
	Tue, 14 Jul 2026 12:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784032573; cv=none; b=EY+AtC/BhDFnQw8SV3kj72tXC85/n6Dmah6UkQh2Yg4HSY40e7kyIuaCBZjIOurSHSEpzhgsqKg9o+cigl0ik6QJhxvtUGKzzdqpSudbt2fbkHE4kyz9jxIyLl98n5xPmaVjGbqmLhUMc/dBTdBGrPf3lRPvaGby0qrLvp/XTGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784032573; c=relaxed/simple;
	bh=b9TtgoyFYkHeVFTrJPUv3nguC7nq6LAuA+FDp2Tmqng=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ieWz/DAMmqCGTKT3vUOS6tWGGVdXhCXkqVHbT5zRoHZk8p+X5Ymf5SQuq0SZcVuVlwEkzcZuZHLJ5rr4qTYAi0+xQlrrn7RvpuO8WHuvDUjujBz0JO8vAzU4psjwC7gl5PrQHCV7JrgpWaxWVEDvphhmDlk4xgp3BWyiF9noxGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UrPZZbTA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UrPZZbTA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA7071F000E9;
	Tue, 14 Jul 2026 12:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784032569;
	bh=kZT5Z2ul6wC3iZrv0Nw2GcNpHjPbc7At9/edEnc7Qkg=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=UrPZZbTAEh6YGXKDalDrxg7NYFAnvD2XRpHhwlhezxIJrbgySiYm/4QfYSTX0l29u
	 t9+6aYKFHKMISHFyEJ8GgUsp+Vq2TC19bnEyoasJZRrQRaoE058bMg1z5g8HPKkZTU
	 KHK4+3A4VpPWdSBpG7ZNoN2sD3XlvNDRAmUh9ZVRhPwiN7FAlYVsXneo0b3C5XUOYU
	 rb6gLX3KFiVD4kZSUCAvG93X2/VhAwpmfamx6oE2+gfN+/XbECIQ6/8ybY9ADYiqTV
	 mTjduzXCdJqAeM9oRZMsV+8wIUrVWx49iYQL7l9EqY50bBLZq+HprCHWfyFexeGPxO
	 9N9wI/sJrgYmQ==
From: Vinod Koul <vkoul@kernel.org>
To: Olivier Dautricourt <olivierdautricourt@gmail.com>, 
 Stefan Roese <sr@denx.de>, Frank Li <Frank.Li@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, dmaengine@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
In-Reply-To: <addaf51275355667045ec300fc8d725e2e273807.1782911845.git.adrian.ho.yin.ng@altera.com>
References: <addaf51275355667045ec300fc8d725e2e273807.1782911845.git.adrian.ho.yin.ng@altera.com>
Subject: Re: [PATCH v2] MAINTAINERS: replace maintainer for Altera mSGDMA
 driver
Message-Id: <178403256654.822807.331281330806123127.b4-ty@kernel.org>
Date: Tue, 14 Jul 2026 18:06:06 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Mon, 06 Jul 2026 10:23:11 +0800, Adrian Ng Ho Yin wrote:
> Olivier Dautricourt has stepped down as maintainer of the Altera
> msgDMA driver as he no longer has access to the hardware. Replace him
> with Adrian Ng Ho Yin as the new maintainer and update the status
> from "Odd Fixes" to "Maintained".
> 
> 

Applied, thanks!

[1/1] MAINTAINERS: replace maintainer for Altera mSGDMA driver
      commit: 49eee9b6c2b5646bd0cfd891bb7c0a218301aa7c

Best regards,
-- 
~Vinod


