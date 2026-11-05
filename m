Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793870583;
	b=Er3CqRH1J59PrWbjcbtMsdvKmoREqrAKInNiculuOZDyAS/tH9wEkUK68J6nCUpX4tkr
	 hjdnYZEdkFaDIizhSXRex9GFGCOxN0l/hEkga5IYdQRZMRL4gqYpO/+466L4Cc7m7Yj2v
	 b/viQdIUmXBy1NMuIgwfIzp8/anwXYpLqGFMD6ItKAhBEVBPdkVpqd10cuV5cpseaEO+8
	 XVWq+LJrCEwat7J6pSJO61KdlGj7SCFs+EtNVQVefGS5rYEd2GYlSEUvBBjspZukEkG+A
	 forqmEsMF40ZFq8/TVJIHVKDD0hHFzRQAxlqB/kxhaDvMJPX9BT9xvM7QZ3eqpe4iQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793870583;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=e6iQLmGUPP/5Q9jpHSc+xQTgG6RXLcsQ0m5VazqI7JQ=;
	b=q8E2eumZN4SPTs6/ib+eVbSXXUu2PF9xIMUvj6230qat2vmW0rcB+kj8p+0Ijrka1trV
	 jYFe2gOBSoX34q0taSsjbAdNcG2M7YPluuFE0G73ZEDfufllJgzDvaaWft2m0b/4/+5Ue
	 dXn23dI/0jLcR2RZ4oX/uz4mxd8Nzh1gerCeA2lNYH9rVQYPOqptunmXA28oTB8U+uX3T
	 XwX+7sf/vKxbcoMwlRA4Et/b7QW2hoWb0b24QXPRmcILprxHyatGbOfuITqy7hJWW6v8B
	 8lHui5zwHjM1nxdJSud6dwNHjP3BgY6PiHtJUZSOd5QC7kd6Au8VndqRGalmFYn0eyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BJ1s94Hu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 1E714606A32F;
	Thu,  5 Nov 2026 09:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BJ1s94Hu
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id B6E361F00A02;
	Thu,  5 Nov 2026 09:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793870582;
	bh=e6iQLmGUPP/5Q9jpHSc+xQTgG6RXLcsQ0m5VazqI7JQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BJ1s94HuPxIxZZ4x0whnQvPrM9sRjHGeRF5it6PhMUOz6ed+mimneaLKyt+FTIE2m
	 PMouGjDVeJa63LmzNPk3iSxmA401KRpPVohxgKnddgv7URtp5XafI/gtiaNLISV05C
	 EtkverieSR0Ly1uGSMHADKUQXxBR2Z0tv7guAmmgpovXQBMpdkexJClLFoLHj1Xg4S
	 rzRDkvQGF64iivJNcuVRL9MDnVJtJ/Zooj3/Pq10+n6slCxWzcu/p6syiHVtM6dnLW
	 mkAiTHjuB1yI1ycXkYib13pDqoU2xizEZRUugkIzlzWWTh83QnHF83r3p9WaXgPfMC
	 VsLoloY+TI0BQ==
Date: Thu, 5 Nov 2026 10:22:58 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org, 
	bartosz.golaszewski@oss.qualcomm.com, pramod.gurav@linaro.org, andy.gross@linaro.org
Subject: Re: [PATCH 0/2] dmaengine: qcom: bam_dma: Fixes for unbind
Message-ID: <zg3bcwwn6nfr6423tfpgshevfxnf2p62lirmdb3v4cozwopul2@leudxnhl56ki>
References: <20261020180804.140766-1-smostafa@google.com>
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020180804.140766-1-smostafa@google.com>

On Tue, Oct 20, 2026 at 06:08:01PM +0000, Mostafa Saleh wrote:
> On Lenovo Mini-x Gen 10 (X1P42100 based) I am using VFIO-platform
> to assing the QCE/BAM to VMs.
> 
> During unbind:
> echo 1dc4000.dma-controller > /sys/bus/platform/drivers/bam-dma-engine/unbind
> echo 1dfa000.crypto > /sys/bus/platform/drivers/qcrypto/unbind
> 
> I see a system reset quite often, looking more into this,
> that seems to be related to runtime PM, with those fixes I don't
> see that anymore.
> 
> This patches apply on linux-next.
> 
> Mostafa Saleh (2):
>   dmaengine: qcom: bam_dma: Take a PM ref at remove()
>   dmaengine: qcom: bam_dma: Do not touch remote BAM in remove()
> 
>  drivers/dma/qcom/bam_dma.c | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
> 
> -- 
> 2.56.0.212.g129ede20d9-goog
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
