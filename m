Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5ADF3EC2D1
	for <dmaengine@vger.kernel.org>; Wed, 22 Jul 2026 16:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784738008; cv=none; b=GNk6W4EDItqXZK+NpEsjx/66vS6DG0m+RHuwIYYlnHc5FgcGLoU0GuFfuTcqQA3UV3d8GZvmPeLiqUyz27++vx+37rUbCfV3JsrLj7dwRLalCcRIha57gME/vv0chX+kQeV+NaBitmLffawoVPCWyKMpu/N0fUb0q6Te6QmORkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784738008; c=relaxed/simple;
	bh=t7uCeuJ/x3axtN8/Acbk5Wk3uh9u2MVimLwqZuyQnAw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=a1OZrpQN992pWyhhnCxumGuS3d1u0EnJ591Jma4J9058ooS479PVZwpRfLZJ56TMi9cTP3FYZmyRk2SVm3mFXZd58iNJ94PH41wIF+E4e4lt4TdODaSXxvpkxMg7w7uerMXLPawWwL8qLsl8Df9yauGac8sPyT1FasI4g2+yd6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cs31tNAg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cs31tNAg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20F1F1F00A3A;
	Wed, 22 Jul 2026 16:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784738007;
	bh=zHd9GMwJ6Qp5UpbwLThOyjRL00jNLuSCaP0dW8gsnjg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cs31tNAg2LhCEZ85h38gWCPlCLqu7MmMoJCBshxkOFdCGut2UGPFpGofrJP2VSEF1
	 QfVIgcuTiSHSuE35O/dANs2w7MRyOriCOvlim3EF9VXgUmhG/TmfMxklFIruGn0zPU
	 EY89G915jqKqpFpJNvuTrGxaCc1MjeBkxLDGx2Ah/NARe9LmCYGbO7aSXoYdd9lCBw
	 k8yTY2ulozg4PAUiLfOhuEOq6r+W64zv5+OY3ahzzveRUoX1VgDZ1eLCccimio2Md3
	 9lofk1d+DqnudBKJk/ewiRjZfZoAm4zQXhQZOoh0DVb3uFgig874WsA6a9Nr4uX46w
	 av13Mk1NcEbtA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] dmaengine: dmatest: Optionally make test errors
 fatal
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nathan Lynch" <nathan.lynch@amd.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260722-dmatest-fixes-and-fatal-errors-v1-4-8287709987ea@amd.com>
References: <20260722-dmatest-fixes-and-fatal-errors-v1-0-8287709987ea@amd.com>
 <20260722-dmatest-fixes-and-fatal-errors-v1-4-8287709987ea@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 16:33:26 +0000
Message-Id: <20260722163327.20F1F1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] A Time-of-Check to Time-of-Use (TOCTOU) race condition on `info->p=
arams.fatal_errors` can cause an unintended kernel panic when the parameter=
 is concurrently set to 0 ('never panic').
--

--- Patch [4]: [PATCH 4/4] dmaengine: dmatest: Optionally make test errors =
fatal ---
commit 289cdfd12c204ee46d7f18f6c08608f36bd53956
Author: Nathan Lynch <nathan.lynch@amd.com>

dmaengine: dmatest: Optionally make test errors fatal

This commit adds a module parameter fatal_errors to dmatest. When set to a
non-zero value, the kernel will panic after accumulating that many test err=
ors
during a run.

> diff --git a/drivers/dma/dmatest.c b/drivers/dma/dmatest.c
> index 0d7752c2451a9..a070ce6f2fa94 100644
> --- a/drivers/dma/dmatest.c
> +++ b/drivers/dma/dmatest.c

[ ... ]

> @@ -487,6 +497,24 @@ static void dbg_result(const char *err, unsigned int=
 n, unsigned int src_off,
>  		dbg_result(err, n, src_off, dst_off, len, data);\
>  })
> =20
> +/*
> + * Record a test error whose details were just logged via result(). When
> + * fatal_errors is set, panic once that many errors have accumulated in =
the
> + * current run.
> + */
> +static void dmatest_note_error(struct dmatest_info *info)
> +{
> +	unsigned int errors;
> +
> +	if (!info->params.fatal_errors)
> +		return;
> +
> +	errors =3D atomic_inc_return(&info->error_count);
> +	if (errors >=3D info->params.fatal_errors)
> +		panic("dmatest: fatal_errors=3D%u and %u error(s) encountered\n",
> +		      info->params.fatal_errors, errors);

[Severity: High]
Can a concurrent modification of the fatal_errors parameter cause a spurious
kernel panic here?

If a user modifies the fatal_errors parameter to 0 (meaning 'never panic') =
via
sysfs while test threads are executing, info->params.fatal_errors could be
concurrently overwritten with 0 via add_threaded_test().

If this happens between the initial check and the second read:

CPU1 in dmatest_note_error()
    if (!info->params.fatal_errors) // reads > 0
        return;

    errors =3D atomic_inc_return(&info->error_count); // acts as a barrier

CPU2 modifying sysfs
    info->params.fatal_errors =3D 0;

CPU1 in dmatest_note_error()
    if (errors >=3D info->params.fatal_errors) // reads 0

Will the condition errors >=3D 0 evaluate to true and inadvertently trigger=
 the
panic? Could we read info->params.fatal_errors into a local variable once to
prevent this race?

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722-dmatest-fi=
xes-and-fatal-errors-v1-0-8287709987ea@amd.com?part=3D4
