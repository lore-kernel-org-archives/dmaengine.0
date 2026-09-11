Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F634A3D28
	for <dmaengine@vger.kernel.org>; Fri, 11 Sep 2026 18:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789150094; cv=none; b=oI1jXGOnB9RSeaaYm+VE6+lLYrhRs0Xpeyb88CjGWJTHmd6Jg2BzNpGFnmzIPqZkqLpdPpIDYc8nuIUqWBiaLopTXYvLvYjggts+NLoMlFGoq42bZch4xkjeG8KoFH/Rrc++1dcGBDD0rHE5VZtwKyLCPyVmH7m+yIl9uhWBUEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789150094; c=relaxed/simple;
	bh=5q6RzS9P+QCHEJ6QonOuHfBSp8x2DpnHbW5+cuLhzdg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=dw6/fl9wRFUG6jGw8GibsjCLFf106qvBJDpMm4PR+gP97H/oGYsDK5AW27MkF2znPOVkWxAvGkBg13Q8sTCBkHMfV30mmtxOQiiLcG6yuKsCIeiRUpbzf0w9BcD1xeDFjkQlInAM9SfnGuLRhgvB2V6jV3Cj8hAXy+Elx04fhrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ofb9+bY6; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ofb9+bY6"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-39b2ad862bdso1653418a91.2
        for <dmaengine@vger.kernel.org>; Fri, 11 Sep 2026 11:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789150089; x=1789754889; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bFQyaHFSe7NbqtGnmovgEQo/OOpNNeM1Djaojhppr5M=;
        b=Ofb9+bY6mxaKX1hjL5KlIBqstgl8mzbR56VpkJQBwM6GJvghAPbtE3+XHf+aN+Eq+q
         ryOIG5JCeWKM8QX9B1+v4ZWlp2x3x8YGUHtKLF9wttIHG/WvS9HtO7nZUhotE8tRrgwe
         uEoFoFGpiePP9/iwS7kv99zu/w4pvJWcYX8KEMwN62V8N1npLki6cf86U6GV1g/Jrc+/
         nXQ+E6GKoTzrtCdld6R8Ew3/YRIuyCsyZ4nRLYixivSqhYXV5t8eJyqo0PyevgmCPAH5
         75b3YESb/XnrT9Ie3F36zL3gqm8hQG5/VPV9OakSdXDOdfZQ5NoVkuyiQtayE40MzeFG
         BYbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789150089; x=1789754889;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bFQyaHFSe7NbqtGnmovgEQo/OOpNNeM1Djaojhppr5M=;
        b=I1GlnRbhppKEUJv83XXAGFVYuGWqINs8QHGgS+WAWcSQF70dpZ7IlnCuXLL20nXN/F
         Xiouri6w5aZRVQhmhcBavnTeQ5X0zpnKt8oZlSiMWtmEVJfR+J4OL+1P85TIfWevesAU
         P1ftQKdTqf1yP+t4+7y0n0D7h7WQFOUCM9q6BZzc31A8p6N8kwhTJAQD6UO3Eb4J/ojM
         CSdF9RYcpk2MD8WhbyiA8Ry2onan1MusRmSwDIrX1xpbBw7B/n6JaVbB3yUaoD5rhTDL
         8zp70rKI/sw6Fbxs3t7Y0ylby/U9ak6yiQs7hYQPISaqjzthPhLtLSzsVTSXq3oMvyOB
         PMEg==
X-Gm-Message-State: AFuF++lDfxsTcIvtn9fSsJ5/nLg8/UlSk0v6TJKSX+LJBxtMPfn8a1Y8
	/UcsLtTKUa8c+l8SdsdjF/biV2LsBcyvIBj7EtCtv6A2h2JTr80o/YNI
X-Gm-Gg: AYBFou2XI7UfItXOSOBnED6yq5w6zvC+M1Nz89o7I4lDbK7/8KrngCLnvjN6lldAu7V
	Lk4HaS7bXEQ3XuAeYFsV6a19gFE/iztpq4uTqxcEcMTId4oThrrUldzemQNYoBfoUTTWx+6N/3T
	u1SPYx+7kEyFPDimWM8BBKmt5nl3HUw3A5Kyb+/mw1ova1hAclc8MnKgX8IRTYY+kHYCPLFssCN
	vcpWur51jIrqbFwIuAdCRQD843xofVpXctGb1SeIbPD/5rzyjFyFE/Zk2XSPkl65zN8dunP7err
	hIy/F3miHkWBe1aKVdARVNINGXWzNrHLurbkfLCb9KAVPeQBb2v8C/PE70+zTCtmjgghJ+l4d6/
	g94NZ3/gNcPn5B08s8j6vbz+VGOQ/2vvTqOc5GIo2p7kqeJz2g+TuDwcetniASz19c9vKN9mv9G
	GUs2rjKRDn5X5Znd2EsjTLy+wZy3SUPMmDT7xCGE4cX49t/SUVzWK0g0c6veow6YT7PTD1s3j+u
	ae4TKMUFK1zOKB/qkLKg92TsVRq4QdMuiP2oha9N0nS2QfLWdH8VlQV83VwRhydHPKbrnVud7X1
	m8qNpqKmwYgDKgC/AHuGDlknK6yTdF81vQxSTnT3Dg3Bsvre
X-Received: by 2002:a17:90b:560e:b0:39b:2c55:365 with SMTP id 98e67ed59e1d1-39d9c1dbb26mr8543491a91.12.1789150088659;
        Fri, 11 Sep 2026 11:08:08 -0700 (PDT)
Received: from localhost ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d9d8aa131sm1695083a91.2.2026.09.11.11.08.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 11:08:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Sep 2026 11:08:06 -0700
Message-Id: <DLCORV3V97BJ.2PEIXFVVVAI95@gmail.com>
Cc: <dmaengine@vger.kernel.org>, "Vinod Koul" <vkoul@kernel.org>, "Frank Li"
 <Frank.Li@kernel.org>, "Yuri Tikhonov" <yur@emcraft.com>, "Dan Williams"
 <djbw@kernel.org>, "Anatolij Gustschin" <agust@denx.de>, "open list"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dmaengine: ppc4xx: use assigned variable for
 dma_free_coherent()
From: "Rosen Penev" <rosenp@gmail.com>
To: "Frank Li" <Frank.li@oss.nxp.com>, "Rosen Penev" <rosenp@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260911035941.200551-1-rosenp@gmail.com>
 <aqQYk44DLfkT8w4l@SMW015318>
In-Reply-To: <aqQYk44DLfkT8w4l@SMW015318>

On Fri Sep 11, 2026 at 8:04 AM PDT, Frank Li wrote:
> On Thu, Sep 10, 2026 at 08:59:41PM -0700, Rosen Penev wrote:
>> In some goto paths, adev->dev is unassigned. Use &ofdev->dev to cover
>> those cases.
>>
>> Fixes: 12458ea06efd7b44281e68fe59c950ec7d59c649 ("ppc440spe-adma: adds u=
pdated ppc440spe adma driver")
>> Signed-off-by: Rosen Penev <rosenp@gmail.com>
>> ---
>
> Please use dmam_alloc_coherent() to fix this problem.
I did just that in a future patch. Might be worthwhile to have this
first for potential backport purposes.
>
> Frank
>
>>  drivers/dma/ppc4xx/adma.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/dma/ppc4xx/adma.c b/drivers/dma/ppc4xx/adma.c
>> index 279a431ccae3..d0863394c723 100644
>> --- a/drivers/dma/ppc4xx/adma.c
>> +++ b/drivers/dma/ppc4xx/adma.c
>> @@ -4212,7 +4212,7 @@ static int ppc440spe_adma_probe(struct platform_de=
vice *ofdev)
>>  	else
>>  		iounmap(adev->dma_reg);
>>  err_regs_alloc:
>> -	dma_free_coherent(adev->dev, adev->pool_size,
>> +	dma_free_coherent(&ofdev->dev, adev->pool_size,
>>  			  adev->dma_desc_pool_virt,
>>  			  adev->dma_desc_pool);
>>  err_dma_alloc:
>> --
>> 2.55.0
>>

