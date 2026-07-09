Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3483C8472
	for <dmaengine@vger.kernel.org>; Thu,  9 Jul 2026 14:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783605918; cv=none; b=dttU2ktNO6Gpsq8CCc6AUcTvCztKZcpe9PeyAsQiVyO9ptbQXtRZOof4W7YT6dK/6leFkux1pvv5KCyv+UBdL017DqDunyZki3UW7aCAm3sax1gPNvKqO8TVQgxUimOAIXkpCWDLSfL92Yy+kMUH+MvuqGMgUBtej17ie6HRw2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783605918; c=relaxed/simple;
	bh=iJnBSmAnWQwwp5+kimECah0oJNANpC2vgQWWW5I9KAY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KwwhJLX2DbuKSJXt3ifS1YoaAlebclAZ2BtSieEvk6Iq7O5oCEt3b2TNm4es1Y99p4pJW8leWb8CLb/06BoUQSAumDtXN30YfYhAdkl6QrBwrYMtH6soRnjsY87vqAaTA5bATTBxgnRXSfxKyxQe8qi21ZG4YIucfiKQROriqM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=daElpAbc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="daElpAbc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C337E1F000E9;
	Thu,  9 Jul 2026 14:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783605917;
	bh=/2B3TMPzBOCh/Pjm5f/dFGrNbhoc0OfsWj373UkUr4Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=daElpAbc6SXRNLDq5b1lIIX4GnZ/heBFNariK8GNiI6mrdhJ4O/7M0su4/1dZmhm3
	 5gjRYCQvrukLKZJ1hlFG8vtN9b7JxBUF1THYBhiNy/rMwZUSCn3TOJazqyuVk6Kosu
	 tnVKzzHOlPuzTRePTHoSJ1ikXT2Nl+uTX4kWsr+UO0qfjDAwS4l96+80B8MvETtp4q
	 yg3vWL05mhAznyb3yP9vsxzqyEi6Ihx/0NWxjlipNBfuMeg9MIi/pacXqOMt1+F/sm
	 FHxCvwq7s8f/tZ3TYziIIRJkwwYMQMe5RWyUR/lWp008ccKX/FMYxv/PD//IhzMDh1
	 AX7TVGm4ucG9w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 1/2] i2c: qcom-geni: Handle runtime PM disabled state
 during early resume
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mukesh Kumar Savaliya" <mukesh.savaliya@oss.qualcomm.com>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260709134623.1724212-2-mukesh.savaliya@oss.qualcomm.com>
References: <20260709134623.1724212-1-mukesh.savaliya@oss.qualcomm.com>
 <20260709134623.1724212-2-mukesh.savaliya@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 14:05:16 +0000
Message-Id: <20260709140516.C337E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Calling pm_runtime_enable() in the resume_noirq callback causes an=
 unbalanced disable_depth, triggering a kernel warning during early resume.
- [High] Treating -EACCES from pm_runtime_get_sync() as success allows uncl=
ocked register accesses on powered-off hardware, risking fatal bus errors.
--

--- Patch [1]: [PATCH v7 1/2] i2c: qcom-geni: Handle runtime PM disabled st=
ate during early resume ---
commit 5b7e2f3ccf132073e5ef0e9e9ebe44fb7923a932
Author: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>

i2c: qcom-geni: Handle runtime PM disabled state during early resume

During the noirq resume phase, the GENI I2C controller may receive transfer
requests before runtime PM has been fully restored. This patch treats the
resulting -EACCES error from pm_runtime_get_sync() as a transient condition
and allows the transfer path to proceed. It also manually enables runtime
PM in the resume_noirq callback.

> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-=
qcom-geni.c
> index 96dbf04138bee..4bc00922cd97b 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -917,6 +917,10 @@ static int geni_i2c_xfer(struct i2c_adapter *adap,
>  	gi2c->err =3D 0;
>  	reinit_completion(&gi2c->done);
>  	ret =3D pm_runtime_get_sync(gi2c->se.dev);
> +	if (ret =3D=3D -EACCES) {
> +		dev_warn(gi2c->se.dev, "Runtime PM is disabled:%d\n", ret);
> +		ret =3D 0;
> +	}

[Severity: High]
Does treating -EACCES as success risk causing fatal bus errors?

If an I2C client device issues a transfer during the system suspend late
or noirq phases before the controller's noirq resume callback runs,
pm_runtime_get_sync() returns -EACCES because the hardware is in
RPM_SUSPENDED (power domain and clocks are off).

By overriding the error and forcing ret =3D 0, the synchronization barrier
is bypassed. The driver will then proceed to write to unclocked hardware
registers, which can trigger a synchronous external abort.

[ ... ]

> @@ -1223,7 +1228,12 @@ static int __maybe_unused geni_i2c_resume_noirq(st=
ruct device *dev)
>  	if (ret)
>  		return ret;
> =20
> +	/* Enforced disable_depth =3D 0 to actually enable runtime PM during no=
irq phase */
> +	if (!pm_runtime_enabled(dev))
> +		pm_runtime_enable(dev);
> +
>  	i2c_mark_adapter_resumed(&gi2c->adap);

[Severity: High]
Will this unbalance the disable_depth counter and trigger a kernel warning?

The PM core's device_suspend_late() disables runtime PM, incrementing
disable_depth. Calling pm_runtime_enable() here prematurely decrements
the counter to 0.

When the PM core subsequently calls pm_runtime_enable() in
device_resume_early(), it will detect an underflow and unconditionally
print the "Unbalanced pm_runtime_enable!" warning on every system
resume cycle.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709134623.1724=
212-1-mukesh.savaliya@oss.qualcomm.com?part=3D1
