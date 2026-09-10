Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40CA4A1DE5
	for <dmaengine@vger.kernel.org>; Thu, 10 Sep 2026 14:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789049422; cv=none; b=hcNUOH7MgW6zfty8MqjtGfFUkkWVH+vLp4bU3Uloos/fv6j6e/pm53VPh+sf6EZUftNxHaxplRwC78buSonQwBfxZ7476C2xAhDvpFfTbI9oh43nAlqSCwwZja0D95iHVfyYoP2C9hK6ZFm4LS0seiUZNclKtUOEY1pd5ruCxp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789049422; c=relaxed/simple;
	bh=gvLm1fzmth7v17j+levU70LX6PT7i/iTJRzUBOR12L4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=eRrEGXiwfwZSwQxy+k/x55PLzzl/U4I+u8VZ23p1NSpRszCK+EtpFAUXgdnOm2CzXRWUSz10P+/Fo90hejliJf46NN5c9TjMY1R2Oi+weN3hcZDVKiBGJu2F4+xnjRmaLs9zIoxkKLOTs/dpK3wQfj/VxQbedmST8KvUoRXjYQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b5xKMQix; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b5xKMQix"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 058CE1F00893;
	Thu, 10 Sep 2026 14:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789049420;
	bh=fZXKBBGPvch7KC977YY/eBllUAvr8MwaR9m/vKOg4dY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=b5xKMQixmgmiPwIdkEBWgh8lLmV/K3QCfuMxI2PoDcEZ3X1xcFOmsfSSLnVmpTSRh
	 ihwGrUEH/dWcdkQlMrcixHSUL6Xa9x6S/rOMDnLnsbAkqePyob+zVoMSovWGEl/K23
	 mnksVCfAOApCcJ9t/63L+1r4/Olms9m/ImfOPy/Rs52eBLdQXS2uPPoTrDhuB/z1zn
	 KIU23/iyPDcDVki0pP6WHl3l85nX698YOGgM3cTCUnHrjsebtcch92ngaAxDIpc9pf
	 /YixnEJDk+VnhGRRXXxyL6QkxeF8gt+c/nHbuno8y0uUrUi4DWtzUiS0wQwuP3FTpQ
	 0wuIzgNzVRhFg==
From: Vinod Koul <vkoul@kernel.org>
To: Binbin Zhou <zhoubb.aaron@gmail.com>, Frank Li <Frank.Li@kernel.org>, 
 dmaengine@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>, 
 Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, 
 Julia Lawall <julia.lawall@inria.fr>, kernel test robot <lkp@intel.com>
In-Reply-To: <20260818093448.3597016-1-zhoubinbin@loongson.cn>
References: <20260818093448.3597016-1-zhoubinbin@loongson.cn>
Subject: Re: [PATCH] dmaengine: loongson: loongson2-apb-cmc: Fix signedness
 bug in irq handling
Message-Id: <178904941755.118320.15943723554182901056.b4-ty@kernel.org>
Date: Thu, 10 Sep 2026 19:40:17 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Tue, 18 Aug 2026 17:34:48 +0800, Binbin Zhou wrote:
> Storing that negative value into an unsigned variable makes the check
> `if (lchan->irq < 0)` always false, so probe errors are not correctly
> detected and propagated.
> 
> Fix this by changing the type of `irq` to `int`, which allows proper
> signed comparison and error handling.
> 
> [...]

Applied, thanks!

[1/1] dmaengine: loongson: loongson2-apb-cmc: Fix signedness bug in irq handling
      commit: bf27ec04a888d4f1301a8da040719f2c332da681

Best regards,
-- 
~Vinod


