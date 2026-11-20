Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795168862;
	b=f9y4Q1DsNQCwGcwvutKanMMe1SN+M7EfDJxSrpHDSuTV6T/XV2ow1GNKNfRJ/qeOD7Tj
	 4/Mw4BQ+1ECoPedUXVuFwzXr1gS2d845v1xXtTrcUyVwwWSGJQ5tD3rH1o2gjC8CVucax
	 /IOBLC2SPc7SS/iySI9382sQa/7AX2mVhCb6Xq2YbIDgJSL9ISKi0hyMizvJ+vLFkPbuX
	 3DL5F7KlF5Sz1U0pz4t87ymTVvm0nvFOdUUTUas8fgsCtU3ywLS9QytJk4XeRXJLh2BoA
	 WhSMr0FAvf7UGYWhsftxAsg3Buy9QoO9BG9czsuTft8GMxH07F7bUmdy+B0Hn2pYl2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795168862;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=f0QcVKMNxcAaXVPUdnauwtdaPEL3ZR0aSqMrJrb/WHs=;
	b=rB98o4qc85ZnYnwa+8SYIhIr8XsdYGEAg/eonAReu+FfMwFkAI0U7rVmD57Qvza+sSy6
	 8NUpmxqJCjAu7T1r4UgFneOMw0uQn7V4ZHSimbLgEcVSXeQdjZ6KFbQ4q5g/VFSkd/zba
	 HiPk8tWVvO3AuJWXvB6cGDsz505Z6SO4PSXVJbiwi3KE+NfgRGvt1HCxbTxL2JGjsKBWH
	 ZjiwtdR/KIBGlf0iKvCrBzugzUs9EbuTKUDx9DT1f2lvihgFZ2YEuI2D8qAZ+oj/GXviU
	 gjCIRJBbFw9MzVyNCLXWWVYvONxgIRfFQ9+2A/2Sl5aANKdjsZAgX2QMFrPY44a0g1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hmg8jGDt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A5B606A338
	for <dmaengine@vger.kernel.org>; Fri, 20 Nov 2026 10:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hmg8jGDt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8C6B1F000E6;
	Fri, 20 Nov 2026 10:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795168861;
	bh=f0QcVKMNxcAaXVPUdnauwtdaPEL3ZR0aSqMrJrb/WHs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=hmg8jGDt8XAKD/VpB+EWhCs7JAB9pnfLfz8g/vNKrTxhAO7PP1F/XANO7ZiFI1Fxm
	 PRGmkB9Ihq6mcDu+XAx+lzycVc9GxjkrcVfYWglD2z7QJWgRUSQnC7yFy1ckCDnPdL
	 hO5SYvSfpAnTWajIZZQNjICiH0FNOYW65odDW53iq4pg7ZvlxSLJqtcIdN+c9b4GPK
	 JnI/gBeHJbRmVMgoLQAlsfadhVwhHzQc4gEmMuSoYogPnySkLdQP9TmBhoBkTSlG2c
	 obluLw1rcbYX5Rzfj5CcMzareT+cCORoQBsBxflK7CzZLJBF0lpup9jRfBVlbCbeUz
	 ijgf53hS0GDPA==
From: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.Li@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: dmaengine@vger.kernel.org
In-Reply-To: <20261102-dmaengine-fixes-v2-1-d0473b3a0ed5@kernel.org>
References: <20261102-dmaengine-fixes-v2-1-d0473b3a0ed5@kernel.org>
Subject: Re: [PATCH v2] dmaengine: Use unique debugfs names
Message-Id: <179516886046.45276.6715278438764227251.b4-ty@kernel.org>
Date: Fri, 20 Nov 2026 15:31:00 +0530
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Mon, 02 Nov 2026 10:23:39 +0100, Linus Walleij wrote:
> DMA40 registers multiple dma_device instances for the same platform
> device. The DMAengine debugfs code uses dev_name(dma_dev->dev) as the
> directory name, so the second and third registrations try to create the
> same directory and print duplicate-name warnings.
> 
> Keep the existing device-name directory for the first registration, but
> use a dev_id-suffixed fallback when that name already exists.
> 
> [...]

Applied, thanks!

[1/1] dmaengine: Use unique debugfs names
      commit: e65c7ef7a0b920c42e67d52e70f2e5ebd63bc918

Best regards,
-- 
~Vinod


