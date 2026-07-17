Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85BC73FADEE;
	Fri, 17 Jul 2026 12:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784291755; cv=none; b=MQK2zy3KSJnVZSVuvNnV0xO1kPtPnY8eP5uLY09A1P8QLI0WMpKj0qrS8YRzGrnwLeM0JpzjDQ2yKI/VLvMxKfAjgW5rNgS9nMcvFExjgbBSFaqlFq/Mjkn0BrRN8lWg+E4LSzjRc7ave/6JA/hmBHuw+uZPKVDJrW8vF0wL7iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784291755; c=relaxed/simple;
	bh=ccosWI9X4jHK+0JHg85OjbycEMIiBdKsnp3Ff38uIp8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ULj6DzWdvhtIOYGVWvZ81J86TrPa9L6cDn6o0vKlITZDTvBpjHdkGECWoARXNV1cbi72NR/mxS/BfAS4ousYrL7DYCnDkEYqokNoKhcRWGPVs1Ig5JcS2LaDsvgJVT2rCX9B68YyteVXEk3R3ZuA3KVGY325YpMVaQvAsOWpaak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GCJAeN3u; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GCJAeN3u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 995F31F00A3F;
	Fri, 17 Jul 2026 12:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784291751;
	bh=vW8pWm8rsdK9m5Q0HotqdfGr5xc15Rx6xUUgGdCCdJQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=GCJAeN3usxOsQR1vVrty384kmMqGCBnPsuNew07uH5FHKnERjy4JwrlUR2XVV4ZO5
	 QbtidVqVs0OVOgQEz0hUZdC0A/mc/1Do6N+jDt+nzq5k/LarE3d7SaBp/k6XTxNEix
	 W1jdXKT51c1n1BY1qjjhk250vIRPi4zg3iQBNY5hNVXeemWigzwAQPi7zB52OyB4Va
	 y6Laq7Vddnmb9FvLOtVuIKkPT/uNjl+L0WKqRfjGjeMPQCxOTr6MyCVGnBIiG7KMYx
	 iUZZ94hpnRpNUksVVTJpMjaqY7wGfjf94l3NMDoUzj9SMPOlgH0jGKhqcoAJCxxzMa
	 /sHZ4FOzm99CQ==
From: Vinod Koul <vkoul@kernel.org>
To: Vignesh Raghavendra <vigneshr@ti.com>, Frank Li <Frank.Li@kernel.org>, 
 Michal Simek <michal.simek@amd.com>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
 dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <b0a22171f3ed68e156a2fa84383e99c23ec6b2ff.1784037977.git.christophe.jaillet@wanadoo.fr>
References: <b0a22171f3ed68e156a2fa84383e99c23ec6b2ff.1784037977.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] dmaengine: Constify struct dma_descriptor_metadata_ops
Message-Id: <178429174814.1176696.13776361509358729486.b4-ty@kernel.org>
Date: Fri, 17 Jul 2026 18:05:48 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Tue, 14 Jul 2026 16:06:33 +0200, Christophe JAILLET wrote:
> 'struct dma_descriptor_metadata_ops' in not modified in these drivers.
> 
> Constifying these structures moves some data to a read-only section, so
> increases overall security, especially when the structure holds some
> function pointers.
> 
> On a x86_64, with allmodconfig, as an example:
> Before:
> ======
>    text	   data	    bss	    dec	    hex	filename
>  120635	  21584	     64	 142283	  22bcb	drivers/dma/xilinx/xilinx_dma.o
> 
> [...]

Applied, thanks!

[1/1] dmaengine: Constify struct dma_descriptor_metadata_ops
      commit: 338c853b7c3b422fefda195b9b8010e40611c96f

Best regards,
-- 
~Vinod


